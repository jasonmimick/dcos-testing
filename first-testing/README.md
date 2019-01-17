

This contains commands to config/loging dcos cli
dcos-login.sh				


example marathon app to deploy ops mgr docker container
mdb-opsmgr-marathon.json

*note* 

```bash
sed 's/%%OM__HOST%%/34.200.235.77/g' mdb-opsmgr-marathon.json > opsmgr.json
```

example marathon app - used to test public connectivity
hello-nginx.json			


archive of the docker folder for 10gen/ops-manager-kuberentes
pay attention to any Dockerfile or scripts/entrypoint.py changes
I had to fudge with this significantly to get it to work
see the tail *.log changes, and python venv package versions for apt-get

mongodb-enterprise-ops-manager.tar.gz



Testing Notes
===

MongoDB Mesosphere Framework Notes


How to setup DCOS:
Please find template for dcos to run over aws :

https://s3.eu-central-1.amazonaws.com/ashu-cluster-template/1.11.0_permissive.json

Please find below steps to add repository to DCOS cluster (ubuntu)
you can follow through this link if you stuck somewhere in below steps : ref. link https://github.com/mesosphere/dcosdev

1. Start EC2 instance and update the machine for latest library changes
2. install git if not present in the machine  `sudo apt-get install git`  
3. Clone the git repository for Dcosdev git clone https://github.com/mesosphere/dcosdev.git
4. Change working drive : cd dcosdev
5. To install and build a docker image that includes dcosdev and the dcoscli, execute the command:
To install:
sudo apt-get install docker
To start:
sudo service docker start
To Build :
docker build --no-cache -f misc/Dockerfile -t mydcosdev .
6. Now, cd (change directory) one path above i.e. home directory and clone dcos-mongodb-enterprise project.
cd dcos-mongodb-enterprise
7. Now, need to run the docker :
To run docker service in the project folder:
docker run -ti --rm -e PROJECT_PATH=$(pwd) -v $(pwd):/dcos-mongodb-enterprise -v /var/run/docker.sock:/var/run/docker.sock mydcosdev bash
cd /dcos-mongodb-enterprise
8. once in container configure the DCOS cluster by installing the DCOS CLI and setting up the cluster URL.
9. Install Marathon-LB and Minio service on DCOS cluster by running below commands:
dcos package install marathon-lb --yes
dcos package install minio --yes
10. Open browser to access the  Public Agent IP (filter by "PublicSlaveSecurityGroup" in ec2 instances to get public IP of public agent) of the cluster as:<public ip>:9000 to access MINIO UI. Create a new bucket name 'artifacts' and provide it with permission through clicking the option menu from artifacts list.
11. In container export MINIO_HOST=<public agent IP of DCOS cluster>
12. finally, from the base directory path of the project, simply run:
dcosdev up

Please let me know if you come across any issues.

Happy Weekend!!


bootstrapuser/deleteme
mineo/minio123


http://minio.marathon.l4lb.thisdcos.directory:9000/artifacts/mongodbservice/agent_api_key.sh



