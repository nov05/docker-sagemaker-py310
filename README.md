# docker-sagemaker-py310
* 2024-11-26 
    * containerized Python development environment  
    * for building a ZIP file for the creation of the SageMaker layer in AWS Lambda  

---   
---  

* Set local working directory  
```bash
cd workspace
```
* Build and run the container
```bash
docker-compose up --build
```

Or    
```bash
docker build -t sagemaker_py310 .
docker run -it -v $(pwd):/workspace sagemaker_py310
```

* List the running containers ("ps" = process status)
```bash
docker ps
```
Result: e.g.
```bash
(base) PS D:\github\docker-sagemaker-py310\workspace> docker ps
CONTAINER ID   IMAGE             COMMAND   CREATED         STATUS         PORTS     NAMES
38157c13abd6   sagemaker_py310   "bash"    5 minutes ago   Up 5 minutes             docker-sagemaker-py310-python-dev-1
```

* Restart a container  
```bash
docker restart <container_id_or_name>
```

* Open a Bash Shell  
```bash
docker exec -it <container_id_or_name> bash
```
You will see the change in shell prompt. e.g.
```powershell
(base) PS D:\github\docker-sagemaker-py310\workspace> docker exec -it 38157c13abd6 bash
root@38157c13abd6:/workspace#
```

* Show the machine architecture of the container's environment, e.g. `x86_64`  
```bash
docker run --rm -it sagemaker_py310 uname -m
```

* Check `SageMaker` and `JSONSchema` version
* Make sure jsonschema<4.18  
```bash
root@38157c13abd6:/workspace# pip show sagemaker
Name: sagemaker
Version: 2.235.2
Summary: Open source library for training and deploying models on Amazon SageMaker.
Home-page:
Author: Amazon Web Services
...
root@af991acff1b6:/workspace# pip show jsonschema
Name: jsonschema
Version: 4.17.3
Summary: An implementation of JSON Schema validation for Python
```

* Now list all the site-packages 
```bash
root@38157c13abd6:/workspace# ls /usr/local/lib/python3.10/site-packages
PyYAML-6.0.2.dist-info              google_pasta-0.2.0.dist-info         pkg_resources                             sagemaker
README.txt                          idna                                 platformdirs                              sagemaker-2.235.2.dist-info
__pycache__                         idna-3.10.dist-info                  platformdirs-4.3.6.dist-info              sagemaker_core
_distutils_hack                     importlib_metadata                   pox                                       sagemaker_core-1.0.16.dist-info       
_multiprocess                       importlib_metadata-6.11.0.dist-info  pox-0.3.5.dist-info                       schema-0.7.7.dist-info
_pyrsistent_version.py              jmespath                             pp                                        schema.py
_yaml                               jmespath-1.0.1.dist-info             ppft                                      setuptools
annotated_types                     jsonschema                           ppft-1.7.6.9.dist-info                    setuptools-65.5.1.dist-info
annotated_types-0.7.0.dist-info     jsonschema-4.17.3.dist-info          protobuf-4.25.5.dist-info                 six-1.16.0.dist-info
attr                                markdown_it                          psutil                                    six.py
attrs                               markdown_it_py-3.0.0.dist-info       psutil-6.1.0.dist-info                    smdebug_rulesconfig
attrs-23.2.0.dist-info              mdurl                                pvectorc.cpython-310-x86_64-linux-gnu.so  smdebug_rulesconfig-1.0.1.dist-info   
boto3                               mdurl-0.1.2.dist-info                pydantic                                  tblib
boto3-1.35.69.dist-info             mock                                 pydantic-2.10.2.dist-info                 tblib-3.0.0.dist-info
botocore                            mock-4.0.3.dist-info                 pydantic_core                             tests
botocore-1.35.69.dist-info          multiprocess                         pydantic_core-2.27.1.dist-info            tqdm
certifi                             multiprocess-0.70.17.dist-info       pygments                                  tqdm-4.67.1.dist-info
certifi-2024.8.30.dist-info         numpy                                pygments-2.18.0.dist-info                 typing_extensions-4.12.2.dist-info    
charset_normalizer                  numpy-1.26.4.dist-info               pyrsistent                                typing_extensions.py
charset_normalizer-3.4.0.dist-info  numpy.libs                           pyrsistent-0.20.0.dist-info               tzdata
cloudpickle                         packaging                            python_dateutil-2.9.0.post0.dist-info     tzdata-2024.2.dist-info
cloudpickle-2.2.1.dist-info         packaging-24.2.dist-info             pytz                                      urllib3
dateutil                            pandas                               pytz-2024.2.dist-info                     urllib3-2.2.3.dist-info
dill                                pandas-2.2.3.dist-info               requests                                  wheel
dill-0.3.9.dist-info                pasta                                requests-2.32.3.dist-info                 wheel-0.45.0.dist-info
distutils-precedence.pth            pathos                               rich                                      yaml
docker                              pathos-0.3.3.dist-info               rich-13.9.4.dist-info                     zipp
docker-7.1.0.dist-info              pip                                  s3transfer                                zipp-3.21.0.dist-info
google                              pip-23.0.1.dist-info                 s3transfer-0.10.4.dist-info
```

* Copy the site-packages to a local temporary folder
```bash
exit
docker cp <container_id_or_name>:/usr/local/lib/python3.10/site-packages D:\tmp
```
Result example:  
```powershell
(base) PS D:\github\docker-sagemaker-py310\workspace> docker cp 38157c13abd6:/usr/local/lib/python3.10/site-packages D:\tmp
Successfully copied 233MB to D:\tmp
```

---  

* Reference
    * [How to Create a Great Local Python Development Environment with Docker](https://youtu.be/6OxqiEeCvMI)
    YouTube, Jan 9, 2023

---  
---  