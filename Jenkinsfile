pipeline {
    agent none

    stages {
        stage('Initial') {
            agent any

            steps {
                sh 'pwd'
            }
        }

        stage('Maven-Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v $HOME/.m2:/root/.m2 -v "$(pwd)"/target:"$(pwd)"/target'
                }
            }

            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('DockerImage-Build') {
//            agent {
//                dockerfile {
//                    additionalBuildArgs  '-t registry.cn-hangzhou.aliyuncs.com/yiyi-jenkins/demo1'
//                }
//            }

            agent any

            steps {
                sh 'pwd'
//                sh './run.sh'
            }
        }
    }
}
