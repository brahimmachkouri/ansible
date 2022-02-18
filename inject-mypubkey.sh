#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "I need the instance name."
    exit
fi

INSTANCE_NAME=$1
multipass copy-files $INSTANCE_NAME:/home/ubuntu/.ssh/authorized_keys .
cat ~/.ssh/id_rsa.pub >> authorized_keys
multipass copy-files authorized_keys $INSTANCE_NAME:/home/ubuntu/.ssh/authorized_keys
echo "Result :"
multipass exec $INSTANCE_NAME -- cat /home/ubuntu/.ssh/authorized_keys
