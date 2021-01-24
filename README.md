# jenkinsfile-runner-example

Example that can run with Jenkinsfile Runner launching a simple Maven build.

Used by:

* [jenkinsfile-runner-google-cloud-run](https://github.com/carlossg/jenkinsfile-runner-google-cloud-run)

## Running

Ic can be directly ran with:

```
docker run --rm -v $(pwd)/Jenkinsfile:/workspace/Jenkinsfile -w /workspace jenkins4eval/jenkinsfile-runner:maven
```
