EPICS Service Test IOC
===
A Simple EPICS IOC for Testing EPICS Middleware Services

## MODULES
All modules can be found in https://github.com/epics-modules

### Minimum Required Modules
* asyn
* std

### Optional Modules
* sequencer
* iocStats : https://github.com/epics-modules/iocStats
* caPutLog : https://github.com/epics-modules/caPutLog
* recsync client (aka RecCaster) : https://github.com/ChannelFinder/recsync
* autosave : https://github.com/epics-modules/autosave
* lua : https://github.com/epics-modules/lua
* retools : https://github.com/brunoseivam/retools


## EPICS Environment
* Standard EPICS environment
* One can see my own setup at https://github.com/jeonghanlee/epics_manifest
* Please check `configure/RELEASE` file


## Startup files


```
./cmd/st.cmd
```


## Two Product IOCs

```
tree bin/linux-x86_64/
bin/linux-x86_64/
├── [jhlee     74K]  ServiceTestIOC
└── [jhlee     75K]  ServiceTestIOCLua

```

* `ServiceTestIOC` : EPICS iocsh
* `ServiceTestIOCLua` : luashell
