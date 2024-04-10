@Library('cicd-jenkins-shared-libraries@v1.15.4') _
def currentUserInfo

pipeline {
    agent { label 'entitymanagement-dev' }
    
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }

    environment {
        BUILD_NOTIFY_WEBHOOK=credentials("channels-1-build-notifications-webhook-url")
        DATE = sh (returnStdout: true, script: 'echo $(date +"%Y-%m-%d_%H%M%S")').trim()
        GITHUB_TOKEN=credentials("github-nice-cxone")
        IGNORE_NORMALISATION_GIT_HEAD_MOVE=1
        NICE_DEVOPS_REGION = "us-west-2"
        NICE_DEVOPS_AWS_ACCOUNT_ID = '369498121101'
        NICE_DEVOPS_REGISTRY_URL = "https://${NICE_DEVOPS_AWS_ACCOUNT_ID}.dkr.ecr.${NICE_DEVOPS_REGION}.amazonaws.com"
        NICE_DEVOPS_REGISTRY_CREDENTIAL="ecr:${NICE_DEVOPS_REGION}:ServiceAccess-jenkins-ecr_${NICE_DEVOPS_AWS_ACCOUNT_ID}"
        SCRIPTS_REPO_URI_WTOKEN="https://oauth2:${GITHUB_TOKEN}@github.com/inContact/channels-cicd.git"
        TAGS="owner=digital-first-integrations,product=digi"
    }

    stages {
        stage('Get Current User Info') {
            steps {
                script {
                    echo " -- Starting to gather user info -- "
                    currentUserInfo = pipelineHelperUtils.getCurrentUserInfo()
                    echo currentUserInfo
                    echo " -- Done gathering user info -- "
                }
            }
        }
    }
}
