TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = SeviceTestIOC
# SeviceTestIOC.dbd will be created and installed
DBD += SeviceTestIOC.dbd

# SeviceTestIOC.dbd will be made up from these files:
SeviceTestIOC_DBD += base.dbd

# Include dbd files from all support applications:
#SeviceTestIOC_DBD += xxx.dbd
SeviceTestIOC_DBD += devIocStats.dbd
SeviceTestIOC_DBD += caPutLog.dbd
SeviceTestIOC_DBD += asyn.dbd
SeviceTestIOC_DBD += std.dbd
SeviceTestIOC_DBD += reccaster.dbd

# Add all the support libraries needed by this IOC
#SeviceTestIOC_LIBS += xxx
SeviceTestIOC_LIBS += devIocStats
SeviceTestIOC_LIBS += caPutLog
SeviceTestIOC_LIBS += asyn
SeviceTestIOC_LIBS += std
SeviceTestIOC_LIBS += reccaster


# SeviceTestIOC_registerRecordDeviceDriver.cpp derives from SeviceTestIOC.dbd
SeviceTestIOC_SRCS += SeviceTestIOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
SeviceTestIOC_SRCS_DEFAULT += SeviceTestIOCMain.cpp
SeviceTestIOC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#SeviceTestIOC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
SeviceTestIOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

