TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ServiceTestIOC
# ServiceTestIOC.dbd will be created and installed
DBD += ServiceTestIOC.dbd

# ServiceTestIOC.dbd will be made up from these files:
ServiceTestIOC_DBD += base.dbd
ServiceTestIOC_DBD += system.dbd

ServiceTestIOC_DBD += dbSubExample.dbd
ServiceTestIOC_DBD += myexampleHello.dbd

# Include dbd files from all support applications:
ServiceTestIOC_DBD += asyn.dbd
ServiceTestIOC_DBD += std.dbd

ServiceTestIOC_LIBS += asyn
ServiceTestIOC_LIBS += std


ifneq ($(AUTOSAVE),)
   ServiceTestIOC_DBD  += as.dbd
   ServiceTestIOC_DBD  += asSupport.dbd
   ServiceTestIOC_LIBS += autosave
endif


ifneq ($(CAPUTLOG),)
   ServiceTestIOC_DBD += caPutLog.dbd
   ServiceTestIOC_LIBS += caPutLog
endif

ifneq ($(devIocStats),)
   ServiceTestIOC_DBD  += devIocStats.dbd
   ServiceTestIOC_LIBS += devIocStats
endif



ifneq ($(RECCASTER),)
   ServiceTestIOC_DBD  += reccaster.dbd
   ServiceTestIOC_LIBS += reccaster
endif

ifneq ($(LUA),)
    ServiceTestIOC_DBD  += luaSupport.dbd 
    ServiceTestIOC_DBD  += luascriptRecord.dbd
    ServiceTestIOC_LIBS += lua
endif

ifneq ($(SNCSEQ),)
    sncExample_SNCFLAGS += +r
    ServiceTestIOC_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    ServiceTestIOC_SRCS += sncExample.stt
    ServiceTestIOC_LIBS += seq pv
endif

#
ServiceTestIOC_SRCS += dbSubExample.c
ServiceTestIOC_SRCS += myexampleHello.c
ServiceTestIOC_SRCS += ServiceTestIOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.

ifneq ($(LUASHELL),)
    ServiceTestIOC_SRCS_DEFAULT += ServiceTestIOCMain_luaShell.cpp
else
    ServiceTestIOC_SRCS_DEFAULT += ServiceTestIOCMain.cpp
endif

ServiceTestIOC_SRCS_vxWorks += -nil-


# Finally link to the EPICS Base libraries
ServiceTestIOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

