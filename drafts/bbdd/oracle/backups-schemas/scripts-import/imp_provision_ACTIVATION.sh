ORACLE_SID="bpm_pro1"
dia=$(date +"%Y-%m-%d_%H_%M")
echo $ORACLE_SID

impdp system/miguel33 DIRECTORY=dp DUMPFILE=expdp_bpm_prov1_provision_2019-01-15_09_44.dmp LOGFILE=impdp_${ORACLE_SID}_${dia}.log SCHEMAS=ACTIVATION TABLE_EXISTS_ACTION=replace
