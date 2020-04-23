#!./bin/linux-x86_64/ServiceTestIOC

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
dbLoadDatabase "dbd/ServiceTestIOC.dbd"
ServiceTestIOC_registerRecordDeviceDriver pdbbase

#-# EPICS BASE
iocshLoad("$(IOCSH_TOP)/iocLog.iocsh",    "IOCNAME=$(IOCNAME), LOG_INET=$(LOG_DEST), LOG_INET_PORT=$(LOG_PORT)")

#-# Load record instances
iocshLoad("$(IOCSH_TOP)/iocStats.iocsh",  "IOCNAME=$(IOC), DATABASE_TOP=$(DB_TOP)")
iocshLoad("$(IOCSH_TOP)/reccaster.iocsh", "IOCNAME=$(IOCNAME), DATABASE_TOP=$(DB_TOP)")
iocshLoad("$(IOCSH_TOP)/caPutLog.iocsh",  "IOCNAME=$(IOCNAME), LOG_INET=$(LOG_DEST), LOG_INET_PORT=$(LOG_PORT)")
iocshLoad("$(IOCSH_TOP)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOC)-as,DATABASE_TOP=$(DB_TOP),SEQ_PERIOD=60")


iocInit()

dbl > "${IOC}_PVs.list"

seq sncExample, "user=$(IOCNAME)"

#EOF
