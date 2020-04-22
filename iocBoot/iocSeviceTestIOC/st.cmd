#!../../bin/linux-x86_64/SeviceTestIOC

#- You may have to change SeviceTestIOC to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/SeviceTestIOC.dbd"
SeviceTestIOC_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=jhlee")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=jhlee"
