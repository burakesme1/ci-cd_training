pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'prod', 
                    url: 'https://github.com/USERNAME/REPO.git'
            }
        }
    }
}
