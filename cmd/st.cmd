#!./bin/linux-x86_64/ServiceTestIOC

epicsEnvSet("TOP","${PWD}")
epicsEnvSet("DB_TOP", "$(TOP)/db")
epicsEnvSet("IOCSH_TOP", "$(TOP)/iocsh")

epicsEnvSet("LOCATION","TESTLAB")


epicsEnvSet("SYSSUBSYS","LBNL")
epicsEnvSet("DEVDI", "TESTIOC")
epicsEnvSet("IOCNAME", "$(SYSSUBSYS):$(DEVDI)")
epicsEnvSet("CF_USERNAME", "jhlee")

epicsEnvSet("LOG_PORT", "7002")
epicsEnvSet("LOG_DEST", "10.0.0.2")

epicsEnvSet("MPORT", "motorSim1")

#-# Register all support components
dbLoadDatabase "dbd/ServiceTestIOC.dbd"
ServiceTestIOC_registerRecordDeviceDriver pdbbase

dbLoadRecords("$(DB_TOP)/dbExample1.db" "user=$(IOCNAME)")
dbLoadRecords("$(DB_TOP)/dbExample2.db" "user=$(IOCNAME), no=1, scan=1 second")
dbLoadRecords("$(DB_TOP)/dbExample2.db" "user=$(IOCNAME), no=2, scan=2 second")
dbLoadRecords("$(DB_TOP)/dbExample2.db" "user=$(IOCNAME), no=3, scan=5 second")

dbLoadRecords("$(DB_TOP)/dbSubExample.db", "user=$(IOCNAME)")


# Create simulated motors: ( start card , start axis , low limit, high limit, home posn, # cards, # axes to setup)
motorSimCreate( 0, 0, -32000, 32000, 0, 1, 6 )
# Setup the Asyn layer (portname, low-level driver drvet name, card, number of axes on card)
drvAsynMotorConfigure($(MPORT), "motorSim", 0, 6)



dbLoadRecords("$(DB_TOP)/motorSimAlarm.db", "P=$(SYSSUBSYS):, D=$(DEVDI)-Motor, PORT=$(MPORT)")
#-# EPICS BASE
#-iocshLoad("$(IOCSH_TOP)/iocLog.iocsh",    "IOCNAME=$(IOCNAME), LOG_INET=$(LOG_DEST), LOG_INET_PORT=$(LOG_PORT)")

#-# Load record instances
iocshLoad("$(IOCSH_TOP)/iocStats.iocsh",  "IOCNAME=$(IOCNAME), DATABASE_TOP=$(DB_TOP)")
#iocshLoad("$(IOCSH_TOP)/reccaster.iocsh", "IOCNAME=$(IOCNAME), DATABASE_TOP=$(DB_TOP)")
#-iocshLoad("$(IOCSH_TOP)/caPutLog.iocsh",  "IOCNAME=$(IOCNAME), LOG_INET=$(LOG_DEST), LOG_INET_PORT=$(LOG_PORT)")
#iocshLoad("$(IOCSH_TOP)/autosave.iocsh", "AS_TOP=$(TOP),IOCNAME=$(IOC)-as,DATABASE_TOP=$(DB_TOP),SEQ_PERIOD=60")


iocInit()

dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

seq sncExample, "user=$(IOCNAME)"

#EOF
