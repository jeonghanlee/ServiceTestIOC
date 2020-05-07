


PAUSE=5


function system_start
{
    local service=$1; shift;
    sudo systemctl enable ${service}
    sudo systemctl start  ${service}
    sleep ${PAUSE}

}

system_start elasticsearch
system_start channelfinder
system_start recsync

