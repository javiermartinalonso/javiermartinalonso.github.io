ORACLE_SID="bpm_prov2"
dia=$(date +"%Y-%m-%d_%H_%M")
export $ORACLE_SID

expdp system/miguel33  DIRECTORY=dp DUMPFILE=expdp_${ORACLE_SID}_provision_${dia}.dmp LOGFILE=expdp_${ORACLE_SID}_provision_${dia}.log schemas=ACTIVATION,ACTIVATION_MEDIATOR,AT_MIGRA,BPM,CRM_MEDIATOR,FILEMANAGER,ITSM_MEDIATOR,NOTIFICATION,PHONEPREFIXES,PROVISION_MONIT,PROVISION,REPORTENGINE