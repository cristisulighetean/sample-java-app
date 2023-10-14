# Sample Java App - Spring Boot Server - DevSecOps Demonstration

## Description

This sample java spring boot app here is designed to demonstrate what a typical java CI workflow may look. We will focus on devSecOps practices and implement it in this repository.

## Stuff to implement

1. Badge that passes the build pipeline
2. Signing of commits
3. Image scanning
4. Scanning of the repository
5. Generating the SBOM
6. Implementing DAST & IAST
7. Signing of the artifacts
8. Scanning of the artifacts
   1. Terraform code
   2. Ansible playbooks
   3. Helm templates
   4. Kubernetes manifests

## Old CircleCI pipeline

In this sample config, we have a single workflow `verify` which will install and cache our required java libraries, and then run the `mvn verify` command. This config makes use of the [Maven orb](https://circleci.com/developer/orbs/orb/circleci/maven) and [Postgres orb](https://circleci.com/developer/orbs/orb/circleci/postgres), packages for CircleCI's config language, which makes writing our config shorter, and easier.

## About This App

This sample application is a spring boot~~~~ REST server written in java, and utilizes the connexion framework which allows us build and run the service from an [OpenAPI/Swagger specification](https://swagger.io/specification/).

### Continuous Food Delivery

When you start up the service, you can open [this page](http://localhost:8080/swagger-ui/index.html) in your browser to view the available API endpoints.

![Swagger UI Screenshot](https://raw.githubusercontent.com/CircleCI-Public/sample-python-cfd/main/.github/img/preview.png)

### Front-End

CFD(Continuous Food Delivery) is a sample application that relies on a separate UI framework. If you would like to run this project locally with a complete UI, you can use a valid CFD front-end, such as one of the following sample projects:

| Language |  GitHub | Description |
|---|---|---|
|  Javascript (Vue.js) | [Link](https://github.com/CircleCI-Public/sample-javascript-cfd)  | A Javascript Front-End for CFD |

## Run and Test Locally

If you would like to try this application out locally, you can find runtime instructions below.

### Requirements

Java 11~~~~+ OR Docker

### Run Local Server

To run the server on a Docker container, please execute the following from the root directory:

```bash
docker-compose up --build
```

If not using docker, to run the server, please execute the following from the root directory:

```sh
./mvnw package
java -jar target/sample-java-cfd-0.0.1-SNAPSHOT.jar
```

### Tests

To launch the unit tests, use pytest:

```sh
./mvnw test
```

## Additional Resources

## License

This repository is licensed under the MIT license.
The license can be found [here](./LICENSE).