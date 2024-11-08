pipeline {
    agent any
    tools {
        maven "Maven"
        jdk "Java"
    }
    environment {
        DOCKER_CREDENTIALS_ID = "docker-credentials" // Set this in Jenkins credentials
        DOCKER_REGISTRY = "your-docker-registry-url"
        REPO_NAME = "service2"
    }
    stages {
        stage("Build and Test") {
            steps {
                sh "mvn clean package"
                sh "mvn test"
            }
        }
        stage("Docker Build and Push") {
            steps {
                script {
                    def imageName = "${DOCKER_REGISTRY}/${REPO_NAME}:latest"
                    docker.build(imageName).withRegistry("", DOCKER_CREDENTIALS_ID).push("latest")
                }
            }
        }
    }
    post {
        success {
            echo "Build and push successful!"
        }
        failure {
            echo "Build or tests failed."
        }
    }
}
