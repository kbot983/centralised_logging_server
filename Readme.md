<h3 align="center">Centralised Logging Server</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/kbot983/centralised_logging_server)](https://github.com/kbot983/centralised_logging_server/issues)

</div>

---

<p align="center"> My project for IT610 class that aggregates logs from different clients to one server
    <br> 
</p>

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Deployment](#deployment)
- [Usage](#usage)
- [Built Using](#built_using)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## 🧐 About <a name = "about"></a>

This project uses vagrant virtual machine to emulate a logging server and two clients. I used rsyslog package for centralised logging system on a centOS server and emulate one centos client and ubuntu client to show it works with different types of client. 

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites

Rsyslog comes pre installed with Ubuntu and CentOS so no need to download it although it is best to update all packages with
```
sudo apt update #CentOS 
sudo yum update #Ubuntu 
```

### Configuring

A step by step series of examples that tell you how I did things.

#### Server side 
* First lets start rsyslog and enable it to start at boot time by using systemctl command
```
sudo systemctl start rsyslog
sudo systemctl enable rsyslog

```
* We need to configure our server. Open rsyslog.conf file which is in ``` /etc/rsyslog.conf ``` 

```
sudo vi /etc/rsyslog.conf
```
* Enable these services by uncommenting them in the file. This will tell rsyslog to use this machine as server and also open up UDP and TCP ports for incoming packets.

```
# provides UDP syslog reception
$ModLoad imudp
$UDPServerRun 514

# provides TCP syslog reception
$ModLoad imtcp
$InputTCPServerRun 514

```
* Now we will tell rsyslog where to store file. So we create a template to show how incoming log files should be saved. We save them in ```/var/log`` folder according to the hostname and programname that is generating logs.  
```
$template RemoteLogs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log"
*.* ?RemoteLogs
& ~
```
``` *.* ``` tells us that any type of severity type of logs should use RemoteLogs template to save

* After it is configure exit out of vim and restart rsyslog using systemctl command 

``` sudo systemctl restart rsyslog ```

Hence after this rsyslog will be open and listening for incoming log files from clients

End with an example of getting some data out of the system or using it for a little demo.

## 🔧 Running the tests <a name = "tests"></a>

Explain how to run the automated tests for this system.

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## 🎈 Usage <a name="usage"></a>

Add notes about how to use the system.

## 🚀 Deployment <a name = "deployment"></a>

Add additional notes about how to deploy this on a live system.

## ⛏️ Built Using <a name = "built_using"></a>

- [MongoDB](https://www.mongodb.com/) - Database
- [Express](https://expressjs.com/) - Server Framework
- [VueJs](https://vuejs.org/) - Web Framework
- [NodeJs](https://nodejs.org/en/) - Server Environment

## ✍️ Authors <a name = "authors"></a>

- [@kylelobo](https://github.com/kylelobo) - Idea & Initial work

See also the list of [contributors](https://github.com/kylelobo/The-Documentation-Compendium/contributors) who participated in this project.

## 🎉 Acknowledgements <a name = "acknowledgement"></a>

- Hat tip to anyone whose code was used
- Inspiration
- References
