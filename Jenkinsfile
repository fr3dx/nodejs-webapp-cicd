pipeline {
    agent any
	
 stages {
        stage('Docker Build and Tag image') {
            steps {
                //sh 'docker build -t nodewebapp:latest .' 
                sh 'docker tag nodewebapp:latest ferencmolnar/nodewebapp:latest'
                //sh 'docker tag samplewebapp ferencmolnar/nodewebapp:$BUILD_NUMBER'
		sh 'echo $BUILD_TAG'
               
            }
        }
     
        stage('Publish image to Docker Hub') {
            steps {
		        withDockerRegistry(credentialsId: 'dockerhub', url: '') {
		        //sh 'docker login --username username --password-stdin < ~/my_passwd'
		        sh 'docker push ferencmolnar/nodewebapp:latest'
		    }
             }
    	}
     
        stage('Run Docker container on Jenkins Agent') {
            steps {
                sh "docker run -d -p 80:80 ferencmolnar/nodewebapp"
            }
        }
	//chech your container if you want before delete countdown 60s
	stage('Remove that container after testing') {
            steps {
                //sh 'docker container rm -f $BUILD_TAG'
		  	sh 'echo Image.imageName()'
		//sh 'sleep 2'
			sh 'echo container removed completed you can repeat this pipeline'
            }
        }
    }
}
