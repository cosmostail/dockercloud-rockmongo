**Overview**

The docker build based on Ubuntu 14.04 and Rockmongo 1.1.7. If you want to build other versions of the rockmongo, just replace the "builds/rockmongo-[version].zip".

The Original Rockmongo repository: https://github.com/iwind/rockmongo

**Features**

* All awesome features provided by Rockmongo.
* You can plugin the "JSON Formatted Configurations" as environment variable which allows you to replace all variables in the rockmongo config.php and also supports multiple servers configurations. 
* Providing not only Docker Compose example as well as Docker Cloud example.

**Run**

`docker run -d -p 80:80 -e 'MONGO_CONF=[{"mongo_name":"Test DB","mongo_host":"test-db","mongo_port":"27017","mongo_auth":"true"}]' cosmostail/dockercloud-rockmongo `

**Docker Compose**

`docker-compose up -d`

**Docker Cloud**



![alt tag](https://github.com/cosmostail/dockercloud-rockmongo/blob/master/images/step1.png)
![alt tag](https://github.com/cosmostail/dockercloud-rockmongo/blob/master/images/step2.png)
