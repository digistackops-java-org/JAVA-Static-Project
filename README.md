## Refer Tools_setup.md for Installing Required Tools for these Project

# Backend-JAVA Application server
## Launch EC2 "t2.micro" Instance and In Sg, Open port "8080" for JAVA Application 
# Step:1 ==> Install the Required packages
```
Launch Ec2 Instance and use Amazon Linux 2 AMI with t2.micro Instance and 
open port "8080" in Seaurity Group for TOMCAT
```
# Tools Setup For the Project 

### Install GIT
```
sudo yum install git -y
``` 

### Install JAVA
####  Installation of openJDK 17
```
sudo dnf update -y
sudo yum install java-17-amazon-corretto-devel -y
``` 

### Install Maven
```
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.12/binaries/apache-maven-3.9.12-bin.tar.gz
sudo tar xzf apache-maven-3.9.12-bin.tar.gz -C /opt
cd /opt
sudo ln -s apache-maven-3.9.12 /opt/maven
```
#### Create Profile for Maven  
```
sudo vi /etc/profile.d/maven.sh
```

```
export M2_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}
```
#### Reload profile
```
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -version
```

### Install Tomcat 
####  Create Tomcat User
```
sudo groupadd tomcat
sudo useradd -g tomcat -d /opt/tomcat -s /bin/false tomcat
``` 
#### Download and Install Tomcat
```
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.52/bin/apache-tomcat-10.1.52.tar.gz
sudo tar -xvf apache-tomcat-10.1.52.tar.gz -C /opt/tomcat --strip-components=1
```
#### Configure Permissions
```
sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod -R 755 /opt/tomcat
```

#### Start/Stop Manually
```
cd /opt/tomcat/bin
sudo chmod +x startup.sh
sudo chmod +x shutdown.sh
```

#### Create Service File
```
sudo vi /etc/systemd/system/tomcat.service
```
```
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/jre"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
```

#### Reload Systemd and enable tomcat
```
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
```

### Tomcat Configuration

#### Manage Users & Roles in Tomcat

```
sudo vim /opt/tomcat/conf/tomcat-users.xml
```

Remove and Replace with  below these configuration within the <tomcat-users> and </tomcat-users> tags

```
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
  <role rolename="admin"/>
  <role rolename="admin-gui"/>
  <role rolename="manager"/>
  <role rolename="admin-script"/>
  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <role rolename="manager-jmx"/>
  <role rolename="manager-status"/>
  <user username="tomcat" password="tomcat" roles="admin,manager,admin-gui,admin-script,manager-gui,manager-script,manager-jmx,manager-status"/>
</tomcat-users>


```

#### Need to Access Tomcat Server Form Anywhere or from Any IP-Address

```
sudo vim /opt/tomcat/webapps/manager/META-INF/context.xml
```
Remove and Replace with the Below Content
```
<?xml version="1.0" encoding="UTF-8"?>
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                   sameSiteCookies="strict" />
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
          allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1 |.*" />
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
</Context>
```

Step:3 ==> Get the Code
### We keep application in one standard location. This is a usual practice that runs in the organization. Lets setup an app directory.
```
sudo mkdir /app
```

```
cd /app
sudo git clone https://github.com/digistackops-java-org/JAVA-Static-Project.git
cd JAVA-Static-Project
```
Switch branch

```
sudo git checkout 01-Local-setup-V1
sudo chown -R $USER:$USER /app/JAVA-Static-Project
```
# Step:4 ==> Build teh Package 

Build your Package
```
mvn clean package
```

## Deploy the Package to Tomcat
```
sudo cp target/sapsecops.war /opt/tomcat/webapps
```

### Access Your App in Browser
```
http://<AWS-Public-IP>:8080/sapsecops
```
<img width="896" height="516" alt="image" src="https://github.com/user-attachments/assets/e3851726-9362-4cdd-b03a-614c40a779a3" />

