pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/vijithchin/portfolio.git'
            }
        }
        stage('build'){
            steps{
                sh 'docker build -t portfolio:v1'
            }
        }
        stage('execute'){
            steps{
                sh 'docker run -d -p 8081:8080 portfolio:v1'
            }
        }
    }
}
