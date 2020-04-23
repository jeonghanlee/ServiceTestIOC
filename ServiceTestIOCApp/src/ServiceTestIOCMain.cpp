/* ServiceTestIOCMain.cpp */
/* Author:  Marty Kraimer Date:    17MAR2000 */

#include <stddef.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <stdio.h>

#include "epicsExit.h"
#include "epicsThread.h"
#include "iocsh.h"

int main(int argc,char *argv[])
{
    if(argc>=2) {    
         iocsh(argv[1]);
         epicsThreadSleep(.2);
     }
     iocsh(NULL);
     epicsExit(0);
     return(0);
}

// #include "luaShell.h"
   
// int main(int argc,char *argv[])
// {
//   luashSetCommonState("default");

//   if(argc>=2) {
//     luash(argv[1]);
//     epicsThreadSleep(.2);
//   }
//   luash(NULL);
//   epicsExit(0);
//   return(0);
// }

