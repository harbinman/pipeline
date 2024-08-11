pipeline {
    agent any

    stages {

        stage('process starting') {
            steps {
                echo "process starting..."
            }
        }

        stage('sonarqube scan') {
            steps {
                sh '''   echo "sonarqube scan..."
                        export PATH=$PAHT:/opt/usr/sonar-scanner/bin
                         sonar-scanner \
                        -Dsonar.projectKey=mynode \
                        -Dsonar.sources=./src \
                        -Dsonar.host.url=http://nexus.winters-tek.net:9001 \
                        -Dsonar.login=sqp_e99c1e0be3ab83b1a43657183711d34f2769e46e
                
                  '''
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
        stage('docker build') {
            steps {
                sh 'echo "docker build..."'
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