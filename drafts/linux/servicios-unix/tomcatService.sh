#!/bin/bash
#
# A RedHat Linux start/stop script for daemons.
#

### BEGIN INIT INFO
# Provides:             daemonTest
# Required-Start:       $network $local_fs $remote_fs
# Required-Stop:        $network $local_fs $remote_fs
# Default-Start:        3 4 5
# Default-Stop:         0 1 2 6
# Short-Description:    Daemon Test
# Description:          A daemon for testing.
### END INIT INFO

#
# Please change the following variables in order to start your service

# For a tomcat daemon script the values would be:
#commandPath="/opt/tomcat/bin"
#command="startup.sh"
#commandExe="$commandPath/$command"
#commandArgs="Application"
#commandLine="$commandExe $commandArgs"
#commandLineKeyword="Application"
#serviceName="AppTomcat"
#serviceNameLo="appTomcat"
#serviceUser="tomcat"
#serviceGroup="tomcat"
# where Application/App/app is the name of the webapp Tomcat must serve
#
# And this script would be in /opt/tomcat/tomcatService.sh

#commandPath="/bin/"                    # path of the launcher
#command="java"                         # name of the launcher without the path
#commandArgs="arg1 arg2"                # arguments for launcher
#commandSearch="word1, word2"           # a keyword list that occurs on the commandline,
#                                       # used to detect an already running service process
#                                       # and to distinguish it from others
#serviceName="DaemonTest"               # service name
#serviceUser="dmntest"                  # OS user name for the service
#serviceGroup="dmntest"                 # OS group name for the service

#
# Variables a configurar
#
commandPath=""
command=""
commandArgs=""
commandSearch=""
serviceName=""
serviceUser=""
serviceGroup=""

#
# Don't touch the script beyond this point!
#

. /etc/init.d/functions                                    # load start/stop script definitions

commandExe="$commandPath/$command"
commandLine="$commandExe $commandArgs"
serviceNameLo="${serviceName,}"
scriptFile=$(readlink -fn $(type -p $0))                   # the absolute, dereferenced path of this script file
scriptDir=$(dirname $scriptFile)                           # absolute path of the script directory
applDir="$scriptDir"                                       # home directory of the service application
serviceUserHome="$applDir"                                 # home directory of the service user
serviceLogFile="/var/log/tomcat/$serviceNameLo.log"               # log file for StdOut/StdErr
serviceConfig="/etc/sysconfig/$serviceNameLo"              # Default init parameters for the service
maxShutdownTime=15                                         # maximum number of seconds to wait for the daemon to terminate normally
pidFile="/var/run/$serviceNameLo.pid"                      # name of PID file (PID = process ID number)
etcInitDFile="/etc/init.d/$serviceNameLo"                  # symlink to this script from /etc/init.d
subsys="/var/lock/subsys/$serviceNameLo"                   # file that represents that a service's subsystem is locked

commandRegexp=""
oldIFS=$IFS
IFS=', ' read -a words <<< "$commandSearch"
IFS=$oldIFS
for i in "${words[@]}"; do
        commandRegexp="$commandRegexp|$i"
done
commandRegexp=${commandRegexp#"|"}


# Makes the file $1 writable by the group $serviceGroup.
function makeFileWritable {
        local filename="$1"

        touch $filename || return 1
        chgrp $serviceGroup $filename || return 1
        chmod g+w $filename || return 1

        return 0;
}

# Returns 0 if the process with PID $1 is running.
function checkProcessIsRunning {
        local pid="$1"

        if [ -z "$pid" -o "$pid" == " " ]; then
                return 1;
        fi
        if [ ! -e /proc/$pid ]; then
                return 1;
        fi

        return 0;
}

# Returns 0 if the process with PID $1 is our service process.
function checkProcessIsOurService {
        local pid="$1"

        grep -q --binary -E "$commandRegexp" /proc/$pid/cmdline
        if [ $? -ne 0 ]
        then
                return 1;
        fi

        return 0;
}

# Returns 0 when the service is running and sets the variable $servicePid to the PID.
function getServicePid {
        if [ ! -f $pidFile ]; then
                return 1;
        fi

        servicePid="$(<$pidFile)"
        checkProcessIsRunning $servicePid || return 1
        checkProcessIsOurService $servicePid || return 1

        return 0;
}

function findProcess {
        local  __resultvar=$1

        local processId=$(pgrep -f "$commandRegexp")
        if [ -z "$processId" ]; then
                return 1
        fi

        eval $__resultvar="'$processId'"
        return 0
}

function startServiceProcess {
        cd $applDir || return 1
        rm -f $pidFile
        makeFileWritable $pidFile || return 1
        makeFileWritable $serviceLogFile || return 1

        if [ -f $serviceConfig ]; then
                . $serviceConfig
        fi

        local cmd="setsid $commandLine >>$serviceLogFile 2>&1"
        #sudo -u $serviceUser $SHELL -c "$cmd" || return 1
	su -l $serviceUser -c "$cmd" || return 1
        sleep 0.1

        findProcess servicePid
        if [ $? -ne 0 ]; then
                echo -ne $"\nCan not find pid for process $serviceName, see logfile $serviceLogFile"
                return 1;
        fi

        echo "$servicePid" > $pidFile
        if checkProcessIsRunning $servicePid; then :;
        else
                echo -ne $"\n$serviceName start failed, see logfile $serviceLogFile."
                return 1;
        fi

        touch $subsys

        return 0;
}

function killProc {
        checkProcessIsRunning $servicePid
        if [ $? -ne 0 ]; then
                rm -f $pidFile
                rm -f $subsys
                return 0;
        fi
        sleep 0.1
        return 1
}

function stopServiceProcess {
        kill $servicePid || return 1
        for ((i=0; i<maxShutdownTime*10; i++)); do
                if killProc; then
                        return 0
                fi
        done

        echo -e $"\n$serviceName did not terminate within $maxShutdownTime seconds, sending SIGKILL..."
        kill -s KILL $servicePid || return 1
        local killWaitTime=15
        for ((i=0; i<killWaitTime*10; i++)); do
                if killProc; then
                        return 0
                fi
        done

        echo $"Error: $serviceName could not be stopped within $maxShutdownTime+$killWaitTime seconds!"
        return 1;
}

function runInConsoleMode {
        getServicePid
        if [ $? -eq 0 ]; then
                echo $"$serviceName is already running";
                return 1;
        fi

        cd $applDir || return 1
        sudo -u $serviceUser $commandLine || return 1
        if [ $? -eq 0 ]; then
                return 1;
        fi

        return 0;
}

function startService {
        getServicePid
        if [ $? -eq 0 ]; then
                echo $"$serviceName is already running";
                return 0;
        fi

        echo -n $"Starting $serviceName   "
        startServiceProcess
        if [ $? -ne 0 ]; then
                failure
                echo
                return 1;
        fi

        success
        echo
        return 0;
}

function stopService {
        getServicePid
        if [ $? -ne 0 ]; then
                echo $"$serviceName is not running";
                return 0;
        fi

        echo -n $"Stopping $serviceName   "
        stopServiceProcess
        if [ $? -ne 0 ]; then
                failure
                echo
                return 1;
        fi

        success
        echo
        return 0;
}

function restartService {
        (stopService && startService) || return 1
}

function conditionalStart {
        getServicePid
        if [ $? -eq 0 ]; then
                restartService
                return $?
        fi
        return 0
}

function checkServiceStatus {
        echo -n $"Checking for $serviceName:   "
        if getServicePid; then
                success
        else
                failure
        fi
        echo

        return 0;
}

function installService {
        getent group $serviceGroup >/dev/null 2>&1
        if [ $? -ne 0 ]; then
                echo $"Creating group $serviceGroup"
                groupadd -r $serviceGroup || return 1
        fi
        id -u $serviceUser >/dev/null 2>&1
        if [ $? -ne 0 ]; then
                echo $"Creating user $serviceUser"
                useradd -r -c "user for $serviceName service" -g $serviceGroup -G users -d $serviceUserHome $serviceUser
        fi

        ln -s $scriptFile $etcInitDFile || return 1

        chkconfig --add $serviceNameLo || return 1
        echo $"$serviceName installed."
        echo $"You may now use '$etcInitDFile' to call this script or 'service $serviceNameLo'."

        return 0;
}

function uninstallService {
        chkconfig --del $serviceNameLo || return 1
        rm -f $etcInitDFile
        echo $"$serviceName uninstalled."

        return 0;
}

function main {
        case "$1" in
                console)                                             # runs the program in console mode
                        runInConsoleMode
                        ;;
                start)                                               # starts the program as a Linux service
                        startService
                        ;;
                stop)                                                # stops the program service
                        stopService
                        ;;
                restart)                                             # stops and restarts the service
                        restartService
                        ;;
                status)                                              # displays the service status
                        checkServiceStatus
                        ;;
                force-reload)                                        # causes the configuration to be reloaded if the service supports this. Otherwise, the service is restarted.
                        restartService
                        ;;
                try-restart|condrestart)                             # restarts the service only if it was active before
                        conditionalStart
                        ;;
                install)                                             # installs the service in the OS
                        installService
                        ;;
                uninstall)                                           # uninstalls the service in the OS
                        uninstallService
                        ;;
                *)
                        echo $"Usage: $0 {console|start|stop|restart|status|force-reload|try-restart|condrestart|install|uninstall}"
                        ;;
        esac

        return $?
}

main $1

