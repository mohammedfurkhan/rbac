pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('asp')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/mohammedfurkhan/rbac.git', branch: 'main'
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    bat 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    bat 'terraform plan -var "principal_id=YOUR_PRINCIPAL_ID" -var "policy_definition_id=YOUR_POLICY_DEFINITION_ID"'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    bat 'terraform apply -var "principal_id=YOUR_PRINCIPAL_ID" -var "policy_definition_id=YOUR_POLICY_DEFINITION_ID" -auto-approve'
                }
            }
        }
        stage('Compliance Validation') {
            steps {
                script {
                    bat 'terraform validate'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        failure {
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
