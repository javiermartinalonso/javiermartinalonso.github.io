ORACLE_SID="bpm_prov1"
dia=$(date +"%Y-%m-%d_%H_%M")
export $ORACLE_SID

expdp system/miguel33  DIRECTORY=dp DUMPFILE=expdp_${ORACLE_SID}_provision_${dia}.dmp LOGFILE=expdp_${ORACLE_SID}_provision_${dia}.log schemas=BPM,REPORTENGINE,PHONEPREFIXES,AT_MIGRA,ACTIVATION,PROVISION_MONIT,ACTIVATION_MEDIATOR,ITSM_MEDIATOR,CRM_MEDIATOR,FILEMANAGER,NOTIFICATION,PROVISION
