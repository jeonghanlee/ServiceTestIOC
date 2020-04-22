#!./bin/linux-x86_64/SeviceTestIOC

epicsEnvSet("TOP","${PWD}")
epicsEnvSet("DB_TOP", "$(TOP)/db")
epicsEnvSet("IOCSH_TOP", "$(TOP)/iocsh")

epicsEnvSet("LOCATION","TESTLAB")


epicsEnvSet("IOC","ServiceTestIOC")
epicsEnvSet("DEV", ":highlevel")
epicsEnvSet("IOCNAME", "$(IOC)$(DEV)")

epicsEnvSet("LOG_PORT", "7002")
epicsEnvSet("LOG_DEST", "10.0.0.2")

#-# Register all support components
dbLoadDatabase "dbd/SeviceTestIOC.dbd"
SeviceTestIOC_registerRecordDeviceDriver pdbbase


#-# Load record instances
iocshLoad("$(IOCSH_TOP)/iocStats.iocsh",  "IOCNAME=$(IOC), DATABASE_TOP=$(DB_TOP)")
iocshLoad("$(IOCSH_TOP)/reccaster.iocsh", "IOCNAME=$(IOCNAME), DATABASE_TOP=$(DB_TOP)")
iocshLoad("$(IOCSH_TOP)/iocLog.iocsh",    "IOCNAME=$(IOCNAME), LOG_INET=$(LOG_DEST), LOG_INET_PORT=$(LOG_PORT)")
iocshLoad("$(IOCSH_TOP)/caPutLog.iocsh",  "IOCNAME=$(IOCNAME), LOG_INET=$(LOG_DEST), LOG_INET_PORT=$(LOG_PORT)")

iocInit()

dbl > "${IOC}_PVs.list"

#EOF
