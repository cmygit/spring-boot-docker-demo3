pipeline {
    agent none

    environment {
        Registry = 'registry.cn-hangzhou.aliyuncs.com'
        NameSpace = 'cmyiyi11'
        ImageName = 'ci-demo1'
        DOCKER_USER_USR = credentials('docker-ali-registry-user')
        DOCKER_USER_PSW = credentials('docker-ali-registry-user')
        DOCKER_USER_USERNAME = credentials('docker-ali-registry-user-username')
        DOCKER_USER_PASSWORD = credentials('docker-ali-registry-user-password')
    }

    stages {
//        stage('maven-build') {
//            agent {
//                docker {
//                    image 'maven:3-alpine'
//                    args '-v $HOME/.m2:/root/.m2'
//                }
//            }
//
//            steps {
//                sh 'mvn -B -DskipTests clean package'
//            }
//        }

        stage('docker-build') {
            agent any

            steps {
                sh 'chmod +x ./docker-build.sh'
                sh './docker-build.sh'
            }
        }

//        stage('clean') {
//            agent any
//
//            steps {
//                cleanWs(notFailBuild: true)
//            }
//        }
    }
}