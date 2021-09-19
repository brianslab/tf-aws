#!/bin/bash

# taken from mtc docs
sudo hostnamectl set-hostname ${nodename} &&
curl -sfL https://get.k3s.io | sh -s - \
--datastore-endpoint="mysql://${dbuser}:${dbpass}@tcp(${db_endpoint})/${dbname}" \
--write-kubeconfig-mode 644 \
--tls-san=$(curl http://169.254.169.254/latest/meta-data/public-ipv4) \
--token="th1s1sat0k3n!"