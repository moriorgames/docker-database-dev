
IMAGE = moriorgames/docker-database-dev"
CONTAINER = "database_dev"

node {
    def app

    stage('Build') {
        echo 'Removing Old projects to prevent failing...'
        sh "docker stop $CONTAINER || true"
        sh "docker rm $CONTAINER || true"
        sh "docker rmi $IMAGE --force || true"

        echo 'Cloning repository...'
        checkout scm
        echo 'Building Docker image...'
        sh "docker build -t $IMAGE ."
        sh "docker run -td --name $CONTAINER -p 3306:3306 $IMAGE"
        sleep 40
    }

    stage('Test') {
        echo 'Testing...'
        def output = sh(script: "docker logs $CONTAINER", returnStdout: true)
        if (output.contains('ERROR')) {
            error("Dump of database failed..")
        }
    }

    stage('Deploy') {
        echo 'Deploying to amazon ECR...'
        def commit = sh(script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
        sh "docker tag $IMAGE $IMAGE:${commit}"
        sh "docker tag $IMAGE $IMAGE:latest"

        docker.withRegistry("https://your.aws.registry.com", "ecr:eu-central-1:aws-credentials") {
          docker.image("$IMAGE:${commit}").push()
          docker.image("$IMAGE:latest").push()
        }
    }
}
