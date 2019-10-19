pipeline {
    agent none

    stages {
        stage('Initial') {
            agent any

            steps {
                sh 'pwd'
            }
        }

        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }

            steps {
                sh 'mvn -B -DskipTests clean package'
                sh './run.sh'
            }
        }

        stage('Check') {
            agent any

            steps {
                sh 'docker images'
            }
        }
    }
}
