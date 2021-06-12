
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
                    sh 'mvn verify | tee mvn.log'
                }
            }
        }
    }
    post {
        success {
            sh '''#!/bin/bash
            git checkout ${BRANCH_NAME}
            gh pr review "${BRANCH_NAME/PR-/}" --comment -b "Jenkins succeeded: $(git rev-parse HEAD)
            
![Party kitten](https://media.giphy.com/media/d77o7i3tHnKda/source.gif)
            
\\`\\`\\`
$(cat mvn.log)
\\`\\`\\`"
            '''
        }
        failure {
            sh '''#!/bin/bash
            git checkout ${BRANCH_NAME}
            gh pr review "${BRANCH_NAME/PR-/}" --comment -b "Jenkins failed: $(git rev-parse HEAD)
            
![Sad kitten](https://media.giphy.com/media/CM1rHbKDMH2BW/source.gif)

\\`\\`\\`
$(cat mvn.log)
\\`\\`\\`"
            '''
        }
    }
}
