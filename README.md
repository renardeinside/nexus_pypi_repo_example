# Pypi repo in Nexus example


# Setup instructions

This is a short example for everyone who step in trouble with deploying your python package 
to internal repository in Nexus.

# Steps 

1. Install and run Docker image with Nexus 3 repository (user/pwd are on Docker page of Nexus 3):
    ```bash
    docker pull sonatype/nexus3
    docker run -d -p 8081:8081 --name nexus sonatype/nexus3
    ```
2. Create in web UI of Nexus repository with setup:
    ```bash
    format - pypi
    type - hosted
    blob store - default
    deployment policy - Allow redeploy
    ```
3. Make a distribution of your package:
    ```bash
    python setup.py sdist bdist_wheel
    ```
4. Upload your package to Nexus via twine:
    ```bash
    twine upload --repository-url http://localhost:8081/repository/<repo-name>/ dist/*
    ```
5. Configure your pip.conf (for example, `~/pip/pip.conf`):
    Content of file `pip.conf` content should be like:
    ```buildoutcfg
    [global]
    index = http://localhost:8081/repository/<repo-name>/pypi
    index-url = http://localhost:8081/repository/<repo-name>/simple
    ```
    Set this options for user:
    ```bash
    vim ~/pip/pip.conf 
    export PIP_CONFIG_FILE=~/pip/pip.conf
    ```
6. Now you can download your package from Nexus 3 PyPi repo:
    ```bash
    pip search example
    ```

# Useful links

- [Nexus 3 docker image](https://hub.docker.com/r/sonatype/nexus3/)
- [Instructions to work with Nexus PyPi](https://help.sonatype.com/repomanager3/pypi-repositories)
- [This perfect answer for troubleshooting](https://support.sonatype.com/hc/en-us/articles/115000572308-Unable-to-install-PyPi-package)
- [This SO thread about using pip install command](https://stackoverflow.com/questions/41801306/nexus-repository-manager-as-pip-local-server-not-working-properly)
