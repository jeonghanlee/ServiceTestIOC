


PAUSE=5


function system_stop
{
    local service=$1; shift;
    sudo systemctl stop ${service}
    sudo systemctl disable  ${service}
    sleep ${PAUSE}
}

system_stop elasticsearch
system_stop channelfinder
system_stop recsync
