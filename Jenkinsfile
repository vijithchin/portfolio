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
                sh 'docker build -t portfolio:v1 .'
            }
        }
		
        stage('delete'){
            steps{
		sh 'docker stop road_runner || true'
                sh 'docker rm road_runner || true'
            }
        }
        stage('execute'){
            steps{
                sh 'docker run -d -p 9999:8055 --name road_runner portfolio:v1'
            }
        }
    }
    post{
        success{
            emailext(to:'vijithchin@gmail.com',
                     subject:'Success Email',
                     body:'This is a success email for $GIT_URL')
        }
        failure{
            emailext(to:'vijithchin@gmail.com',
                     subject:'Failure Email',
                     body:'This is a failure email $GIT_URL')
        }
    }
}
