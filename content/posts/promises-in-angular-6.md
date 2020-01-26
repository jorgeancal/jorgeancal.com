+++
title= "Promises in Angular 6"
date= 2020-01-23T22:56:50Z
type = "posts"
draft = false
description = "In this post you will learn about promises in Angular, which I think is a really interesting thing because you really need to know about it when you implement an API in your project and you want to have control of your application and not be crossing your fingers hoping that everything works properly."
tags = ["Angular 5", "development", "JavaScript", "JS", "Promise"]
+++
In this post you will learn about promises in Angular, which I think is a really interesting thing because you really need to know about it when you implement an API in your project and you want to have control of your application and not be crossing your fingers hoping that everything works properly.

Everything I just said happened to me when I started developing in Angular, which is something… I don’t recommend to anyone. Nowadays, I’m developing with another technology and I don’t want to forget anything about it so I created this post. Let’s go!
What are promises ?

A promise in angular is a kind of object which we use to handle asynchronous tasks. A promise has 3 stages:
1. Pending: the promise’s result hasn’t been determined.
2. Fulfilled: the asynchronous task has been completed and it has a value.
3. Rejected: the task has failed and it has a value too, but this value is the reason why this task failed.

Example

I’m going to show you a very simple example of a promise with a HTTP conection. The first thing is to create an application in Angular which I think everyone knows how to do. The next thing is to create a service, you can do this step in two ways. I’m going to tell you both and you can choose which you prefer:

1. Create a file called street-crimes2.service.ts or whatever you want to call it.
2. By using the following command in your console:

```bash
    ng generate service StreetCrimes
```
If you went for the second way, lucky you. You don’t have to write a lot of things later. If you used the first way, copy and paste the next text into that class:

```javascript
    import { Injectable } from '@angular/core';
    import { HttpClient } from '@angular/common/http';

    @Injectable()
    export class StreetCrimesService {

      constructor(private http: HttpClient ) {}

      search(lat: number, long: number, yearMonth: string) {
        return this.http
          .get(`https://data.police.uk/api/crimes-street/all-crime?lat=${lat}&lng=${long}&date=${yearMonth}`)
          .toPromise();

      }
    }
```

Looks good, doesn’t it? Well let’s explain all this code a bit. The two lines on the top, as always, are imports of the class which we are going to use. The `@injectable` is the service’s decorator.  The constructor, as its name says, is the function which allows us to create the service. The `search(lat: number, long: number, yearMonth: string)` is our function which is going to give us the promise because in Angular 6 it is going to give us an Observable, which I’ll explain in another post. In this case, we add `toPromise()` and we’ll have a promise.

Now you have to go to your component. I’m going to do it in the AppComponent which is quick for me in this example. Your component should be like the following:

```javascript
    import { Component } from '@angular/core';
    import {StreetCrimesService} from "./StreetCrimesService";


    @Component({
      selector: 'app-root',
      templateUrl: './app.component.html',
      styleUrls: ['./app.component.scss']
    })
    export class AppComponent {
      title = 'app';

      constructor( private streetCrimesService: StreetCrimesService){}

      search() {
        this.streetCrimesService.search(52.629729, -1.131592, "2018-01")
          .then((result) => {
            console.log(JSON.stringify(result));
          })
          .catch((error) => console.error(error));
      }

    }
```

This looks like a normal component but we add the service in the constructor of the component because we need to initialize it, if your IDE doesn’t add the import on the top, you’ll have to do it manually. As you can see in the file, I wrote the service inside the function which I’m going to call from the HTML later. I added the variables which I need for the API and after that I added two more things- two functions, one is inside the “then()” and other inside the “catch”. The first function is going to be executed when the call to the API works correctly and it gives us a result and in this case it’s going to print the result in the browser console. The second is going to be executed when the API doesn’t work correctly, that means, if you had an error in the process of the HTTPs request it will go there and print an error in the browser console .

After that, we have to go to the template of our component and put the function in some tags to execute it. I created the next button:
```html
    <button (click)="search()"> Buscar</button>
```
When you press it, the promise is running, so after that you have to open your browser console and you’re going to see something like that:

![console](/images/promises/angular5Console.png)

This was everything, I hope it was useful for someone and sorry for my English.

Bye
