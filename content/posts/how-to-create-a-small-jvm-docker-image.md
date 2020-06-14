+++
title: "How to Create a Small Jvm Docker Image"
date: 2020-02-21T23:23:01Z
draft: true
type = "posts"
draft = false
comments = true
description = "Here, you will learn about how to create a smalls images for your microservices. "
tags= ["java", "kotlin", "Dockerimages", "Docker", "jvm", "jre"]
+++

In this post you'll learn about how to create a small images for your microservices. we are going to do two different things. First we are going to create two different images, we are going to create a base image, and then we'll create an image for the service.

Firstly you are going to need a java project. So you have to go to your root folder project. When you are there you have to run the next command:
```shell script
jdeps --list-deps {{jar-name}}.jar
```

This command is going to give us a list of modules that we are using in our java microservice. I'm running this again to hello-world java service, so I'm not going to have that many dependencies. My output was the following one:
```shell script
$ jdeps --list-deps hello-0.0.1-SNAPSHOT.jar
  java.base
  java.logging
  not found
```

The previous output is going to tell us which modules we are using in the jar. Now we need to crate our JRE. 

```Shell script
$ jlink --module-path /opt/java/jmods --compress=2 --strip-debug --no-header-files --no-man-pages --add-modules java.base,java.logging --output /opt/jlink 
```

Now, we have our runtime in `/opt/jlink` folder that we can use to run our application and this folder is going to be around 30 Mb instead of 240 Mb which is the normal size of the JDK. 

Nowadays we need to create automated tasks to make everything easier. These steps are really easy to set in a Dockerfile. If you do this you could create an image that is smaller than 100 Mb, maybe a bit more if you have a lot of dependencies. It may look difficult but it's not. I'll try to create another post showing how to do this in an automated way with the dockerfile. I hope you like this post so far and I'll see you in the next one. 


