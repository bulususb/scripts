#!/bin/bash

echo "Checking email queue name"

SERVER_NAME=$(hostname)
PORT=$(hostname -i | awk -F. '{print $4}')
INSTANCE_NAME_1=$SERVER_NAME"_"$PORT"_59111"
INSTANCE_NAME_2=$SERVER_NAME"_"$PORT"_59112"
echo instance one is $INSTANCE_NAME_1
echo instance two is $INSTANCE_NAME_2

for INSTANCE in $INSTANCE_NAME_1 $INSTANCE_NAME_2
do
cd /app/karaf-3.0.3/
cd instances/$INSTANCE/etc
echo current location is -- $(pwd)
grep 'fail.queue.name.to.post' *
echo changing fail.queue.name.to.post to right value
sudo sed -i -e 's/fail.queue.name.to.post=emailqueue/fail.queue.name.to.post=failemailq/g' com.drfirst.support.email.impl.EmailQueueConsumer.cfg
echo $?
cd
done
