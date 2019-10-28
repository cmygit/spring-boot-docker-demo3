pipeline {
    agent none

    environment {

        REGISTRY = 'registry.cn-hangzhou.aliyuncs.com'
        NAME_SPACE = 'cmyiyi11'
        IMAGE_NAME = 'ci-demo1'

        DOCKER_USER_USERNAME = credentials('docker-ali-registry-user-username')
        DOCKER_USER_PASSWORD = credentials('docker-ali-registry-user-password')

        RUN_CONTINER = true
        HOST_PORT = 9090
        CONTAINER_PORT = 8080

        PUSH_IMAGE = false
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
                sh 'chmod +x ./docker-build.sh'
                sh './docker-build.sh'
            }
        }

        stage('clean') {
            agent any

            steps {
                cleanWs(notFailBuild: true)
            }
        }
    }
}