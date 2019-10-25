pipeline {
    agent none

    environment {
        Registry = 'registry.cn-hangzhou.aliyuncs.com'
        NameSpace = 'cmyiyi11'
        ImageName = 'ci-demo1'
    }

    stages {
        stage('maven-build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v $HOME/.m2:/root/.m2'
                }

            }

            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('docker-build') {
            agent any

            steps {
                sh 'chmod +x ./run.sh'
                sh './run.sh'
            }
        }

        post {
            always {
                steps {
                    cleanWs(notFailBuild: true)
                }
            }
        }
    }
}