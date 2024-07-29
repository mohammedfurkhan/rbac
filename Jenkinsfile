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
                    bat 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    bat 'terraform plan -var "principal_id=1b4532b9-6e2e-41b6-8161-6ddc3dd1c740" -var "policy_definition_id=/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26"'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    bat 'terraform apply -var "principal_id=1b4532b9-6e2e-41b6-8161-6ddc3dd1c740" -var "policy_definition_id=/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26" -auto-approve'
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
    }
}
