# Sample Java App - Spring Boot Server - DevSecOps Demonstration

![Docker Image Vulnerability Scan](https://github.com/cristisulighetean/sample-java-app/actions/workflows/docker-image-scan.yaml/badge.svg) ![Repository Scan](https://github.com/cristisulighetean/sample-java-app/actions/workflows/repository-scan.yaml/badge.svg) ![Generation of SBOM](https://github.com/cristisulighetean/sample-java-app/actions/workflows/generating-sbom.yaml/badge.svg)

## Description

This sample java spring boot app here is designed to demonstrate what a typical java CI workflow may look. We will focus on devSecOps practices and implement it in this repository.

## DevSecOps to implement

1. Signing of commits
2. Implementing DAST & IAST
3. Signing of the artifacts
4. Scanning of the artifacts
   1. Terraform code
   2. Ansible playbooks
   3. Helm templates
   4. Kubernetes manifests

## DevSecOps implemented

1. Image scanning for vulnerabilities (once a day) using Trivy
   1. The pipeline will fail if there are any HIGH & CRITICAL vulnerabilities
2. Scanning of the repository using Trivy and placing the issued into the Security tab
3. Generation of the SBOM using Trivy and sending it to the Dependency Graph
4. Badge that passes the build pipeline
   1. The URL that has to be added will have the following format:

        ```sh
        https://github.com/OWNER/REPOSITORY/actions/workflows/WORKFLOW-FILE/badge.svg
        ```

   2. More information can be found [here](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge)

## Deep-dive into the implemented topics

### Signing commits

1. First create a gpg key.

    ```sh
    gpg --full-generate-key
    ```

2. List the keys.

    ```sh
    gpg --list-secret-keys --keyid-format=long
    ```

3. From the list of GPG keys, copy the long form of the GPG key ID you'd like to use. In this case, it is `3AA5C34371567BD2`.

    ```sh
    $ gpg --list-secret-keys --keyid-format=long
    /Users/hubot/.gnupg/secring.gpg
    ------------------------------------
    sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
    uid                          Hubot <hubot@example.com>
    ssb   4096R/4BB6D45482678BE3 2016-03-10
    ```

4. Paste the text below, substituting in the GPG key ID you'd like to use.

    ```sh
    gpg --armor --export 3AA5C34371567BD2
    ```

5. Copy your GPG key, beginning with `-----BEGIN PGP PUBLIC KEY BLOCK-----` and ending with `-----END PGP PUBLIC KEY BLOCK-----`.
6. Add the GPG key to your Github account.

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