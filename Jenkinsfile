pipeline {
    agent none

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v $HOME/.m2:/root/.m2'
                    label 'master-node1'
                }

            }

            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('Check') {
            agent {
                label 'master-node1'
            }

            steps {
                sh 'ls'
            }
        }
    }
}