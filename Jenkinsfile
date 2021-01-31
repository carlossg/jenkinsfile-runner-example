pipeline {
    agent any
    options {
        timestamps()
    }
    stages {
        stage('Build') {
            steps {
                sh 'git clone https://github.com/carlossg/jenkinsfile-runner-example.git'
                echo 'Hello world!'
                echo "VARIABLE1: ${VARIABLE1}"
                echo "VARIABLE2: ${VARIABLE2}"
                dir('jenkinsfile-runner-example') {
                    withMaven {
                        sh 'mvn verify'
                    }
                }
            }
        }
    }
}
