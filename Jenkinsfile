pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'git clone https://github.com/carlossg/jenkinsfile-runner-example.git'
                echo 'Hello world!'
                sh 'cd jenkinsfile-runner-example && mvn -Duser.home=/tmp clean package'
            }
        }
    }
}
