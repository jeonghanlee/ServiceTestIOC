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
* iocStats
* caPutLog
* recsync client (aka RecCaster)
* autosave
* lua


## EPICS Environment
* Standard EPICS environment
* One can see my own setup at https://github.com/jeonghanlee/epics_manifest
* Please check `configure/RELEASE` file

## LuaShell 

Instead of `iocsh`,

```
echo "LUASHELL=ENABLE" > configure/RELEASE.local
make rebuild
```


## Startup files


* all except luaShell 

```
./cmd/st.cmd
```


