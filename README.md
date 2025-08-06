## Refer Tools_setup.md for Installing Tools for these Project

### Clone the Repo
```
sudo git clone https://github.com/techizone-Small-Project-org/JAVA-Static-Project.git

```
### Awitch to Local-Setup Branch
```
cd JAVA-Static-Project
sudo git checkout Local-setup
```

### Execute mvn command to create Package
```
mvn clean package
```
### Deploy these Artifact to Tomcat-Dev
```
sudo cp target/maven-web-application.war /opt/tomcat/webapps
```