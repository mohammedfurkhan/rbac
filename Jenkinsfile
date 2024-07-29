pipeline {
    agent any
    
    environment {
        AZURE_CREDENTIALS = credentials('asp')
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                // Clone your repository containing Terraform/ARM templates
                checkout([$class: 'GitSCM', 
                          branches: [[name: '*/main']], 
                          userRemoteConfigs: [[url: 'https://github.com/mohammedfurkhan/rbac.git']]])
            }
        }
        
        stage('Install Terraform') {
            steps {
                script {
                    // Ensure Terraform is installed
                    bat 'terraform --version'
                }
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    bat 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    // Generate a Terraform plan
                    bat 'terraform plan -out=tfplan'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }
        
        stage('Clean Up') {
            steps {
                script {
                    // Clean up the Terraform workspace
                    bat 'terraform workspace delete -force'
                }
            }
        }
    }
    
    post {
        always {
            // Archive Terraform plan if needed
            archiveArtifacts artifacts: '**/*.tfplan', allowEmptyArchive: true
        }
        success {
            echo 'Deployment Successful'
        }
        failure {
            echo 'Deployment Failed'
        }
    }
}
