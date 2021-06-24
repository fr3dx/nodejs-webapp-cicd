pipeline {
    agent any
	
 stages {
        stage('Docker Build and Tag image') {
            steps {
                //sh 'docker build -t nodewebapp:latest .' 
                sh 'docker tag nodewebapp:latest ferencmolnar/nodewebapp:latest'
                //sh 'docker tag samplewebapp ferencmolnar/nodewebapp:$BUILD_NUMBER'               
            }
        }
     
        stage('Publish image to Docker Hub') {
            steps {
		        withDockerRegistry(credentialsId: 'dockerhub', url: '') {
		        //sh 'docker login --username username --password-stdin < ~/my_passwd'
		        //sh 'docker push ferencmolnar/nodewebapp:latest'
			image.push '$BUILD_TAG:latest'
		    }
             }
     
        stage('Run Docker container on Jenkins Agent') {
            steps {
                sh "docker run -d -p 80:80 $BUILD_TAG"
            }
        }
	//chech your container if you want before delete countdown 60s
	stage('Remove that container after testing') {
            steps {
		echo "$BUILD_TAG - container removed completed you can repeat this pipeline"
            }
        }
    }
}
