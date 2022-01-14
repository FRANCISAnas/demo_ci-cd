# <div align="center">Password generator</div>

This project will show you automation deployment from devloper machine to AWS instance using CI/CD tools like Docker and Jenkins. Web application that keep in SCM Git need for generation pseudo random password using opportunities of /dev/urandom of system based on the Linux kernel. After deploy finish on EC2 instance you will see docker container on port 80.

Scheme of CI/CD this project:
![Scheme of CI/CD](https://github.com/OlesYudin/demo_ci-cd/blob/main/scheme.png "Scheme CI/CD")

WEB application:

- Ubuntu 16.04+;
- Apache2;
- PHP 7.0.

AWS EC2 Instance:

- Docker container.

Local machine:

- Jenkins and pluggin 'Publish Over SSH';
- SSH keys (GitHub and EC2 instance);

Working dir:

- /html - contain WEB application
- /terraform - need for creating Infrastructure as a Code
