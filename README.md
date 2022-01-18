# <div align="center">Password generator</div>

This project will show you automation deployment from devloper machine to AWS instance using CI/CD tools like Docker and Jenkins. Web application that keep in SCM Git need for generation pseudo random password using opportunities of /dev/urandom of system based on the Linux kernel. After deploy finish on EC2 instance you will see docker container on port 80.

### <div align="center">Scheme of CI/CD this project:</div>

![Scheme of CI/CD](https://github.com/OlesYudin/demo_ci-cd/blob/main/scheme.png "Scheme CI/CD")

Local machine:

- Jenkins and pluggin 'Publish Over SSH';
- SSH keys (GitHub and EC2 instance).

AWS EC2 Instance:

- Docker container.

WEB application on instance:

- Ubuntu 16.04+;
- Apache2;
- PHP 7.0.

Working dir:

- [/html](https://github.com/OlesYudin/demo_ci-cd/tree/main/html "App directory") - contain WEB application
- [/terraform](https://github.com/OlesYudin/demo_ci-cd/tree/main/terraform "Terraform directory") - need for creating Infrastructure as a Code
  https://github.com/OlesYudin/demo_ci-cd/tree/main/terraform
