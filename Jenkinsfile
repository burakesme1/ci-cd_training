pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'prod', 
                    credentialsId: 'github-token',
                    url: 'https://github.com/USERNAME/REPO.git'
            }
        }
    }
}
