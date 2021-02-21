pipeline {
    agent any
    options {
        timestamps()
    }
    stages {
        stage('Build') {
            steps {
                echo 'Hello world!'
                echo "VARIABLE1: ${VARIABLE1}"
                echo "VARIABLE2: ${VARIABLE2}"
                withMaven {
                    sh 'mvn verify'
                }
            }
        }
    }
    post {
        success {
            sh '''#!/bin/bash
            git checkout ${BRANCH_NAME}
            gh pr review "${BRANCH_NAME/PR-/}" --comment -b "Jenkins succeeded test: $(git rev-parse HEAD)"
            '''
        }
        failure {
            sh '''#!/bin/bash
            git checkout ${BRANCH_NAME}
            gh pr review "${BRANCH_NAME/PR-/}" --comment -b "Jenkins failed test: $(git rev-parse HEAD)"
            '''
        }
    }
}
