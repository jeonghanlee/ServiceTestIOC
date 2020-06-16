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
Common_dbds += base.dbd
Common_dbds += system.dbd
#
Common_dbds += dbSubExample.dbd
Common_dbds += myexampleHello.dbd

# Include dbd files from all support applications:
Common_dbds += asyn.dbd
Common_dbds += std.dbd

Common_libs += asyn
Common_libs +=  std


#ifneq ($(SNCSEQ),)
sncExample_SNCFLAGS += +r
Common_dbds += sncExample.dbd
# A .stt sequence program is *not* pre-processed:
Common_srcs += sncExample.stt
Common_libs += seq pv
#endif




ifneq ($(MOTOR),)
Common_dbds += motorSupport.dbd
Common_dbds += devSoftMotor.dbd
Common_dbds += motorSimSupport.dbd
Common_libs += softMotor
Common_libs += motorSimSupport
Common_libs += motor
endif

ifneq ($(CALC),)
Common_dbds += calcSupport.dbd
Common_dbds += transformRecord.dbd
Common_libs += calc
endif



ifneq ($(AUTOSAVE),)
   Common_dbds += as.dbd
   Common_dbds += asSupport.dbd
   Common_libs += autosave
endif


ifneq ($(CAPUTLOG),)
   Common_dbds += caPutLog.dbd
   Common_libs += caPutLog
endif

ifneq ($(devIocStats),)
   Common_dbds += devIocStats.dbd
   Common_libs += devIocStats
endif


ifneq ($(RECCASTER),)
   Common_dbds += reccaster.dbd
   Common_libs += reccaster
endif



ifneq ($(RETOOLS),)
   Common_dbds += retools.dbd
   Common_libs += retools
endif




Common_srcs += dbSubExample.c
Common_srcs += myexampleHello.c



#
ServiceTestIOC_DBD  += $(Common_dbds)
ServiceTestIOC_LIBS += $(Common_libs)
ServiceTestIOC_SRCS += $(Common_srcs)
ServiceTestIOC_SRCS += ServiceTestIOC_registerRecordDeviceDriver.cpp

ServiceTestIOC_SRCS_DEFAULT += ServiceTestIOCMain.cpp

ServiceTestIOC_SRCS_vxWorks += -nil-

# Finally link to the EPICS Base libraries
ServiceTestIOC_LIBS += $(EPICS_BASE_IOC_LIBS)


# Build the main IOC entry point on workstation OSs.

ifneq ($(LUA),)
    PROD_IOC += ServiceTestIOCLua
    DBD += ServiceTestIOCLua.dbd
    ServiceTestIOCLua_DBD  += $(Common_dbds)
    ServiceTestIOCLua_DBD  += luaSupport.dbd 
    ServiceTestIOCLua_DBD  += luascriptRecord.dbd
    ServiceTestIOCLua_LIBS += $(Common_libs)
    ServiceTestIOCLua_LIBS += lua
    ServiceTestIOCLua_SRCS += $(Common_srcs)
    ServiceTestIOCLua_SRCS += ServiceTestIOCLua_registerRecordDeviceDriver.cpp
    ServiceTestIOCLua_SRCS_DEFAULT += ServiceTestIOCMain_luaShell.cpp
    ServiceTestIOCLua_LIBS += $(EPICS_BASE_IOC_LIBS)
endif




#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

