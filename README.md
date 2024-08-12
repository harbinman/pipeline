

--mysql docker run

docker run --name mysql --restart always -p 3306:3306 -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD= -d mysql:lts --mysql-native-password

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '';
FLUSH PRIVILEGES;

-- custom jenkins docker run
docker run -d --restart always -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home -v /opt/usr:/opt/usr --name jenkins harbinman/customjenkins:lts

--sonar-scanner
sonar-scanner \
  -Dsonar.projectKey=mynode \
  -Dsonar.sources=src/ \
  -Dsonar.host.url=http://nexus.winters-tek.net:9001 \
  -Dsonar.login=sqp_e99c1e0be3ab83b1a43657183711d34f2769e46e

--trivy 
  docker run -rm -d -v $HOME/Library/Caches:/root/.cache/ aquasec/trivy:0.54.1 image  --severity HIGH,CRITICAL nexus.winters-tek.net:8083/harbinman/mynode:${BUILD_NUMBER}
