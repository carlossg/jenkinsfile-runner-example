pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'git clone https://github.com/carlossg/jenkinsfile-runner-google-cloud-run-example.git'
                echo 'Hello world!'
                sh 'mvn -Duser.home=/tmp clean package'
            }
        }
    }
}
