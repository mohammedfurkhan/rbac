pipeline {
    agent any // Use 'any' to run on any available agent

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
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -var "principal_id=YOUR_PRINCIPAL_ID" -var "policy_definition_id=YOUR_POLICY_DEFINITION_ID"'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -var "principal_id=YOUR_PRINCIPAL_ID" -var "policy_definition_id=YOUR_POLICY_DEFINITION_ID" -auto-approve'
                }
            }
        }
        stage('Compliance Validation') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
