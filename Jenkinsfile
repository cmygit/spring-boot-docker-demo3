pipeline {
    agent none

    stages {
        stage('Build') {
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

        stage('Check') {
            agent any

            steps {
                sh 'ls'
                sh './run.sh'
            }
        }
    }
}