pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('azure-service-principal')
    }

    parameters {
        string(name: 'PRINCIPAL_ID', defaultValue: '', description: 'The principal ID for role assignment')
        string(name: 'POLICY_DEFINITION_ID', defaultValue: '', description: 'The policy definition ID')
    }

    stages {
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
                    sh 'terraform plan -var "principal_id=${params.PRINCIPAL_ID}" -var "policy_definition_id=${params.POLICY_DEFINITION_ID}"'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -var "principal_id=${params.PRINCIPAL_ID}" -var "policy_definition_id=${params.POLICY_DEFINITION_ID}" -auto-approve'
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
