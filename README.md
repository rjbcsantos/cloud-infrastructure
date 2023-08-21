# Cloud Infrastructure Interview test
The goal of this test is to "containerize" a sample application and write the necessary code to run it in a kubernetes cluster

## Delivery
To submit the code, publish it to a public github repository, or a zipped file with all the contents that allow the code to be executed. Feel free to add a README.md file with instructions

## Evaluation Criteria
The code you submit will be used in the technical interview, and you will be questioned about decisions made on the implementation.

The code in this repository is written in a way to make local development easier, which makes for bad practices when running it in a remote environment like a production server.
Change (add, move, remove, modify, etc) any files in this repository to fulfill the requirements on the next section, while delivering **production grade** code, with what you feel are best practices, considering a project that will
be maintained by multiple people, and run 24/7 in a global scale.
To highlight a few criteria:
- Code organization
- Security
- Performance
- Availability
- Cost

## Requirements
1. Create a container image with the application in this repository and publish it in a public repository (dockerhub, quay, etc);
2. Write all the code you feel necessary to deploy the image in a kubernetes cluster;
3. Expose the application externally to the kubernetes cluster;
4. Configure the application to be deployed in a highly available setup, considering the cluster has worker nodes in 3 different availability zones;

## Testing
To test this, use any free local kubernetes distribution, like [minikube](https://github.com/kubernetes/minikube), [kind](https://kind.sigs.k8s.io/), [k3d](https://k3d.io), etc.

## Optional Goals
These are suggestions of optional improvements to be done, if you have time:
- Configure Kubernetes to authenticate to a private container repository;
- Create a script automating image building and deployment;
- Add a reverse proxy to route requests instead of exposing the main service;
- Write a few test scenarios, either for performance, functional or any other relevant kind of testing;
- Create a script to configure a local kubernetes cluster, deploy the application and run the test scenarios mentioned above;
- Configure the local kubernetes cluster to have 2+ worker nodes;

# How to run this application

1. run `yarn install`
2. create a SQL database with `docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=test -e MYSQL_DATABASE=test -e MYSQL_USER=test -e MYSQL_PASSWORD=test -d mariadb:5.5`
3. run `yarn typeorm migration:run`
4. open `http://localhost:3000/posts` and see an empty list
5. test with `curl`, `postman` or similar tools


