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
            gh pr review "${BRANCH_NAME/PR-/}" --comment -b "Jenkins succeeded: $(git rev-parse HEAD)\n[[ https://media.giphy.com/media/d77o7i3tHnKda/source.gif | height = 100px ]]"
            '''
        }
        failure {
            sh '''#!/bin/bash
            git checkout ${BRANCH_NAME}
            gh pr review "${BRANCH_NAME/PR-/}" --comment -b "Jenkins failed: $(git rev-parse HEAD)"
            '''
        }
    }
}
