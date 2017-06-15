pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo "World" >> Hello'
            }
        }
        stage('Test'){
            steps {
                sh 'grep World Hello'
            }
        }
        stage('Deploy') {
            steps {
                sh 'grep World Hello|wc -l'
            }
        }
    }
}
