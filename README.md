# jenkinsfile-runner-example

Example that can run with Jenkinsfile Runner launching a simple Maven build.

Used by:

* [jenkinsfile-runner-google-cloud-run](https://github.com/carlossg/jenkinsfile-runner-google-cloud-run)

## Running

Build the Jenkinsfile-runner custom docker image

```
docker build -t jenkinsfilerunner-example .
```

It can be directly ran with:

```
docker run -ti --rm \
    -v $(pwd)/Jenkinsfile:/workspace/Jenkinsfile \
    -v ~/.m2/repository/:/root/.m2/repository/ \
    -w /workspace jenkinsfilerunner-example
```
