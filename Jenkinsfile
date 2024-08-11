pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('nexus')
	}
    stages {

        stage('process starting') {
            steps {
                echo "process starting..."
            }
        }
                
        stage('sonarqube scan') {
            steps {

                nodejs('NodeJS') {
                    sh '''   echo "sonarqube scan..."
                        export PATH=$PATH:/opt/usr/sonar-scanner/bin/
                         sonar-scanner \
                        -Dsonar.projectKey=mynode \
                        -Dsonar.sources=./src \
                        -Dsonar.host.url=http://nexus.winters-tek.net:9001 \
                        -Dsonar.login=sqp_e99c1e0be3ab83b1a43657183711d34f2769e46e
                
                  '''
                    }
               
            }
        }
        stage('build') {
            steps {
                sh 'echo "build..."'
            }
        }
        stage('test') {
            steps {
                sh 'echo "test..."'
            }
        }
        stage('docker image build and push to nexus ') {
            steps {
                sh '''
                      
                      echo "docker build..."
                      docker build -t mynode .
                      docker tag mynode:${BUILD_NUMBER} nexus.winters-tek.net:8082/harbinman/mynode:${BUILD_NUMBER}
                      echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                      docker push nexus.winters-tek.net:8082/harbinman/mynode:${BUILD_NUMBER}                
                    
                   '''
            }
        }
        stage('trivy scan') {
            steps {
                sh 'echo "docker build..."'
            }
        }
        stage('artifactory trivy result to nexus') {
            steps {
                sh 'echo "artifactory trivy result to nexus..."'
            }
        }
        stage('docker push to nexus') {
            steps {
                sh 'echo "docker push to nexus..."'
            }
        }
        stage('update eks deployment file') {
            steps {
                sh 'echo "update eks deployment file ..."'
            }
        }        
    }
   post {
            always {
                sh 'echo "post ..."'
            }
        }
}