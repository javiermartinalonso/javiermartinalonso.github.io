ORACLE_SID="bpm_prov1"
dia=$(date +"%Y-%m-%d_%H_%M")
export $ORACLE_SID

expdp system/miguel33  DIRECTORY=dp DUMPFILE=expdp_${ORACLE_SID}_bpm_${dia}.dmp LOGFILE=expdp_${ORACLE_SID}_bpm_${dia}.log schemas=bpm
