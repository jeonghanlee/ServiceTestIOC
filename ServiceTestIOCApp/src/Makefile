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


ifneq ($(ASYN),)
Common_DBDs += asyn.dbd
Common_DBDs += drvAsynIPPort.dbd
Common_DBDs += drvAsynSerialPort.dbd
Common_LIBs += asyn
endif

ifneq ($(MODBUS),)
Common_DBDs += modbusSupport.dbd
Common_LIBs += modbus
endif

ifneq ($(SNMP),)
Common_DBDs += devSnmp.dbd
Common_LIBs += devSnmp
SYS_PROD_LIBS += netsnmp
endif

ifneq ($(STD),)
Common_DBDs += stdSupport.dbd
Common_LIBs += std
endif

ifneq ($(CALC),)
Common_DBDs += calcSupport.dbd
Common_LIBs += calc
endif




ifneq ($(SNCSEQ),)
sncExample_SNCFLAGS += +r
Common_dbds += sncExample.dbd
# A .stt sequence program is *not* pre-processed:
Common_srcs += sncExample.stt
Common_libs += seq pv
endif



ifneq ($(STREAM),)
Common_DBDs += stream.dbd
Common_LIBs += stream
endif

ifneq ($(RETOOLS),)
Common_DBDs += retools.dbd
Common_LIBs += retools
endif

ifneq ($(MEASCOMP),)
Common_DBDs += measCompSupport.dbd
Common_LIBs += measComp
ServiceTest_SYS_LIBS += uldaq
endif

ifneq ($(SSCAN),)
Common_DBDs += sscanSupport.dbd
Common_LIBs += sscan
endif

ifneq ($(BUSY),)
Common_DBDs += busySupport.dbd
Common_LIBs += busy
endif

ifneq ($(SCALER),)
Common_DBDs += scalerSupport.dbd
Common_LIBs += scaler
endif

ifneq ($(MCA),)
Common_DBDs += mcaSupport.dbd
Common_LIBs += mca
endif

ifneq ($(ETHER_IP),)
Common_DBDs += ether_ip.dbd
Common_LIBs += ether_ip
endif

ifneq ($(AUTOSAVE),)
Common_DBDs += asSupport.dbd
Common_LIBs += autosave
endif

ifneq ($(devIocStats),)
Common_DBDs += devIocStats.dbd
Common_LIBs += devIocStats
endif

ifneq ($(RECCASTER),)
Common_DBDs += reccaster.dbd
Common_LIBs += reccaster
endif

ifneq ($(CAPUTLOG),)
Common_DBDs += caPutLog.dbd
Common_LIBs += caPutLog
endif


ifneq ($(OPCUA),)
Common_DBDs += opcua.dbd
Common_LIBs += opcua
endif

## VACUUM
ifneq ($(RGAMV2),)
Common_DBDs += rgamv2Include.dbd
Common_LIBs += rgamv2
endif

ifneq ($(UNIDRV),)
Common_DBDs += unidrv.dbd mks.dbd
Common_LIBs += unidrv mks re2
endif

# QPC doesn't have any libs and dbd files
ifneq ($(QPC),)
Common_DBDs +=
Common_LIBs +=
endif


## Instrumentation
ifneq ($(EVENTGENERATORSUP),)
Common_DBDs += eventGeneratorSup.dbd
Common_LIBs += eventGeneratorSup
endif

ifneq ($(BPMSUP),)
Common_DBDs += bpmSup.dbd
Common_LIBs += bpmSup
endif

## LLRF
ifneq ($(FEED),)
Common_DBDs += feed.dbd
Common_LIBs += feed
endif

## PSC
ifneq ($(PSCDRV),)
Common_DBDs += pscCore.dbd
Common_LIBs += pscCore
endif



ifneq ($(MOTORSIM),)
Common_dbds += motorSimSupport.dbd
Common_libs += motorSimSupport
endif


Common_srcs += dbSubExample.c
Common_srcs += myexampleHello.c

#Common_dbds += PVAServerRegister.dbd
#Common_dbds += qsrv.dbd
#Common_libs += qsrv


# https://epics.anl.gov/tech-talk/2024/msg00460.php
# QSRV2
ifdef PVXS_MAJOR_VERSION # prefer QSRV2 :)
Common_DBDs += pvxsIoc.dbd
Common_LIBs += pvxsIoc pvxs
else
ifdef EPICS_QSRV_MAJOR_VERSION # fallback to QSRV1
Common_LIBs += qsrv
Common_LIBs += $(EPICS_BASE_PVA_CORE_LIBS)
Common_DBDs += PVAServerRegister.dbd
Common_DBDs += qsrv.dbd
endif
endif
#
ServiceTestIOC_DBD  += $(Common_dbds)
ServiceTestIOC_LIBS += $(Common_libs)
ServiceTestIOC_SRCS += $(Common_srcs)
ServiceTestIOC_SRCS += ServiceTestIOC_registerRecordDeviceDriver.cpp

ServiceTestIOC_SRCS_DEFAULT += ServiceTestIOCMain.cpp

ServiceTestIOC_SRCS_vxWorks += -nil-

# Finally link to the EPICS Base libraries
ServiceTestIOC_LIBS += $(EPICS_BASE_IOC_LIBS)
ServiceTestIOC_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)




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

