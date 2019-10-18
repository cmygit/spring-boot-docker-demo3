pipeline {
    agent none

    stages {
        stage('Initial') {
            agent any

            steps {
                sh 'docker --version'
            }
        }

        stage('Maven-Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v $HOME/.m2:/root/.m2 -v $PWD:/usr/src/mymaven -w /usr/src/mymaven'
                }
            }

            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('DockerImage-Build') {
            agent {
                dockerfile {
                    additionalBuildArgs  '-t registry.cn-hangzhou.aliyuncs.com/yiyi-jenkins/demo1'
                }
            }

            steps {
                sh './run.sh'
            }
        }
    }
}
