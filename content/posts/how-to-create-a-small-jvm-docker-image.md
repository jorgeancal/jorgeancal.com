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

In this post you'll learn about how to create a smalls images for your microservices. we are going to do two different things. First we are going to create two different images, we are going to create a base image and then we'll create a image for the service.

Firstly you are going to need a java project. So you have to go to your root folder project. When you are there you have to run the next command:
```shell script
jdeps -s {{jar-name}}.jar
```

This command is going to gives us a list of modules which we are using in our java microservice. I'm running this again to hello-world java service so I'm not going to have that much of dependencies. My output was the following one:
```shell script
$ jdeps -s complete/build/libs/hello-0.0.1-SNAPSHOT.jar

hello-0.0.1-SNAPSHOT.jar -> java.base
hello-0.0.1-SNAPSHOT.jar -> java.logging

```

