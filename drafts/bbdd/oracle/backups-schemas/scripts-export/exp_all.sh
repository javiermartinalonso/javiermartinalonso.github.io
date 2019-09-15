ORACLE_BASE="/u01/app/oracle"
ORACLE_HOME="/u01/app/oracle/product/12.1.0/dbhome"
ORACLE_SID="bpm_prov1"
dia=$(date +"%Y-%m-%d_%H_%M")
export ORACLE_SID 
export ORACLE_HOME
export ORACLE_BASE

$ORACLE_HOME/bin/expdp miguel/miguel33  DIRECTORY=dp DUMPFILE=expdp_${ORACLE_SID}_full_${dia}.dmp LOGFILE=expdp_${ORACLE_SID}_full_${dia}.log  full=yes