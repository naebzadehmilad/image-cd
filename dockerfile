FROM alpine
RUN apk add openssh && apk add curl net-tools
###RUN TO HOST ssh-keygen -b 2048 -t rsa -f /sshkey -q -N ##copy id_rsa & copy id_rsa.pub to container
COPY id_rsa /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/
###COPY id_rsa >>  to target host for example runner2:/root/.ssh/authorized_keys
RUN ssh -o StrictHostKeyChecking=no -t  root@192.168.10.32 'ls'
