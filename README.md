## Refer Tools_setup.md for Installing Required Tools for these Project

### Clone the Repo
```
sudo git clone https://github.com/digistackops-java-org/JAVA-Static-Project-Local.git
```
### Awitch to Local-Setup Branch
```
cd JAVA-Static-Project-Local
sudo git checkout 01-Local-setup
sudo chown -R ec2-user:ec2-user /home/ec2-user/JAVA-Static-Project-Local 
```

### Execute mvn command to create Package
```
mvn clean package
```
### Deploy these Artifact to Tomcat-Dev
```
sudo cp target/sapsecops.war /opt/tomcat/webapps
```

### Access Your App in Browser
```
http://<AWS-Public-IP>:8080/sapsecops
```
