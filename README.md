# <div align="center">Password generator</div>

This project will show you automation deployment from devloper machine to AWS instance using CI/CD tools like Docker and Jenkins. Web application that keep in SCM Git need for generation pseudo random password using opportunities of /dev/urandom of system based on the Linux kernel. After deploy finish on EC2 instance you will see docker container on port 80.

### <div align="center">Scheme of CI/CD this project:</div>

![Scheme of CI/CD](https://github.com/OlesYudin/demo_ci-cd/blob/main/Images/Scheme.png "Scheme CI/CD")

Local machine:

- Jenkins and pluggin 'Publish Over SSH';
- SSH keys (GitHub and EC2 instance).

AWS EC2 Instance (WebServer):

- Docker container.

In Docker container on webserver used:

- Ubuntu 16.04+;
- Apache2;
- PHP 7.4.

AWS EC2 Instance (Jenkins) **(FUTURE)**:

1. Install docker and login;
2. Push image from [DockerHub](https://hub.docker.com/ "DockerHub") with [jenkins/jenkins:2.330-alpine](https://hub.docker.com/layers/jenkins/jenkins/2.330-alpine/images/sha256-3a351e0ab19b497dc4c862d950a64bc8d323410a287a080ce453dd56a6c33579?context=explore "jenkins/jenkins:2.330-alpine") image;
3. Install plugins for Git connections and PublishOverSSH
4. You need configure your project at Jenkins Managment Tool, give credentials from git repository and configure you server for SSH connections.

Working dir:

- [/Docker](https://github.com/OlesYudin/demo_ci-cd/tree/main/Docker "Docker directory") - contains Docker container that push to AWS EC2
- [/terraform](https://github.com/OlesYudin/demo_ci-cd/tree/main/terraform "Terraform directory") - need for creating Infrastructure as a Code
- [/images](https://github.com/OlesYudin/demo_ci-cd/tree/main/Images "Images directory") - Directory for keep images of project
