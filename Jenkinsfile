pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v $HOME/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock -u root'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('Check') {
            steps {
                sh 'pwd'
                sh 'ls'
                sh 'docker info'
                sh 'docker build -t registry.cn-hangzhou.aliyuncs.com/yiyi-jenkins/jenkins-demo1 .'
            }
        }
    }
}
