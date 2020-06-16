EPICS Service Test IOC
===
A Simple EPICS IOC for Testing EPICS Middleware Services

## MODULES
All modules can be found in https://github.com/epics-modules


## Databases
* `motorSimAlarm.db` and its template files : [1]
* `iocAdminSoft.db` : [2]
* `reccaster.db` : [3]
* `save_restoreStatus.db` : [4]
* `dbExampleX.db` : EPICS base


### Minimum Required Modules
* asyn
* std
* sequencer


### Optional Modules

* iocStats : https://github.com/epics-modules/iocStats
* caPutLog : https://github.com/epics-modules/caPutLog
* recsync client (aka RecCaster) : https://github.com/ChannelFinder/recsync
* autosave : https://github.com/epics-modules/autosave
* lua : https://github.com/epics-modules/lua
* retools : https://github.com/brunoseivam/retools
* calc
* motor


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


## References 
[1] https://github.com/shroffk/motorsim
[2] https://github.com/epics-modules/iocStats
[3] https://github.com/ChannelFinder/recsync
[4] https://github.com/epics-modules/autosave
