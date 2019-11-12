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
- [Built Using](#built_using)

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
* Now we will tell rsyslog where to store file. So we create a template to show how incoming log files should be saved. We save them in ```/var/log``` folder according to the hostname and program name that is generating logs.  
```
$template RemoteLogs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log"
*.* ?RemoteLogs
& ~
```
``` *.* ``` tells us that any type of severity type of logs should use RemoteLogs template to save

* After it is configure exit out of vim and restart rsyslog using systemctl command 

``` 
sudo systemctl restart rsyslog 

```

* Hence after this rsyslog will be open and listening for incoming log files from clients. You can check status of rsyslog using systemctl command

```
sudo systemctl status rsyslog
```


#### Client side

* Setting up client is again starting rsyslog and enabling it like we did on server side and configuring rsyslog from ``` /etc/rsyslog.conf ```

``` 
sudo systemctl start rsyslog
sudo systemctl enable rsyslog
sudo vi /etc/rsyslog.conf

```
* Add this to your conf file and save it. 

```
  *.* @@ADD-SERVER-IP-ADDR-HERE:514  #example *.* @@192.168.33.10:514
```

``` *.* ``` says that all type of logs should go to this IP addr. 
``` @@ ``` defines we are using TCP protocol to send. You can use ``` @ ``` for UDP protocol.

* Save it and restart rsyslog 

```
sudo systemctl restart rsyslog
```

* Client is now configured to send all types of logs onto server. You can again check status of rsyslog by using systemctl command

```
sudo systemctl status rsyslog

```

## 🚀 Deployment <a name = "deployment"></a>

### Prequistes for deployment

1. [Vagrant](https://www.vagrantup.com/downloads.html)
2. [Oracle VM virtual box or any virtual box provider](https://www.oracle.com/virtualization/technologies/vm/downloads/virtualbox-downloads.html)

### Deploying 

I have already created scripts and vagrant files that will automatically do everything. First download this git repository onto your machine and change active directory to ``` centralised_logging_server``` and just vagrant up will set everything. 

```
git clone https://github.com/kbot983/centralised_logging_server.git
cd centralised_logging_server
vagrant up
```


## ⛏️ Built Using <a name = "built_using"></a>

- [Vagrant](https://www.vagrantup.com/)
- [Rsyslog](https://www.rsyslog.com/) 