
#include <stddef.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <stdio.h>

#include "epicsExit.h"
#include "epicsThread.h"

#include "luaShell.h"
   
int main(int argc,char *argv[])
{
  luashSetCommonState("default");

  if(argc>=2) {
    luash(argv[1]);
    epicsThreadSleep(.2);
  }
  luash(NULL);
  epicsExit(0);
  return(0);
}

