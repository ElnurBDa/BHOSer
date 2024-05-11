# Notes before running the presentation
You need to have Obsidian to present. As it is in `.md` you need other application for presenting.
Async Functions in JavaScript
---
---
**Key Points:** 
- Callbacks
- Promises 
	- MultiPromises
- Async
- Axios
- Fetch
---
*Let's begin our journey into the asynchronous side of JavaScript!*

---
# Callback
**Definition**: Callbacks are functions passed into another function as an argument to be executed later. They help in handling asynchronous operations.


---
### Without Callback 
**Problem**: Using `getPosts` and `createPosts` simultaneously can lead to timing issues. `getPosts` may execute before `createPosts` finishes, missing the latest post.

---

```js
posts = [
    { title: 'Post One', body: 'This is post One' },
    { title: 'Post Two', body: 'This is post Two' }
];

// getting posts from server, with 1 second delay
function getPosts(){
    setTimeout( () => {
        let output = '';
        posts.forEach( (post, index) => {
            output += `<li> ${post.title} </li>`;
        });
        document.querySelector('div').innerHTML = output;
    }, 1000 );
}

// creating posts, which will delay 2 seconds
function createPosts(post){
    setTimeout(  () => {
        posts.push(post);
    }, 2000);
}

// calling functions
createPosts({ title: 'Post Three', body: 'This is post Three'});
getPosts();
```
---
### with CallBack
**Solution**: Implement a callback in `createPosts`. This ensures `getPosts` is called only after `createPosts` is complete, maintaining the correct order.

----
```js
posts = [
    { title: 'Post One', body: 'This is post One' },
    { title: 'Post Two', body: 'This is post Two' }
];

// getting posts from server, with 1 second delay
function getPosts(){
    setTimeout( () => {
        let output = '';
        posts.forEach( (post, index) => {
            output += `<li> ${post.title} </li>`;
        });
        document.querySelector('div').innerHTML = output;
    }, 1000 );
}

// creating posts, which will delay 2 seconds. second parameter will be callback
// you can use any name instead of callback, but this is common practice!
function createPosts(post, callback){
    setTimeout(  () => {
        posts.push(post);
        // calling callback function
        callback();
    }, 2000);
}

// calling createPosts function, and second parameter will getPosts function
createPosts({ title: 'Post Three', body: 'This is post Three'}, getPosts);
```

---
# Promises
**Promises**: An alternative to callbacks, promises represent the eventual completion or failure of an asynchronous operation.

---
## Code Snippet
```js
posts = [
    { title: 'Post One', body: 'This is post One' },
    { title: 'Post Two', body: 'This is post Two' }
];

// getting posts from server, with 1 second delay
function getPosts(){
    setTimeout( () => {
        let output = '';
        posts.forEach( (post, index) => {
            output += `<li> ${post.title} </li>`;
        });
        document.querySelector('div').innerHTML = output;
    }, 1000 );
}

// creating posts, which will delay 2 seconds.
function createPosts(post){
    // we'll return a Promise
    return new Promise( (resolve, reject) => {
        setTimeout( () => {
            posts.push(post);

            const error = false;
            // if success resolve, if not reject
            if(!error){
                resolve();
            }else{
                reject('Error: something wrong!');
            }
        }, 2000);
    });
}
```
---
## Handling Promises
Use `.then()` for success and `.catch()` for error handling in Promises.
```js
createPosts({ title: 'Post Three', body: 'This is post Three'})
    .then(getPosts)
    .catch(err => console.log(err));
```
---
# Async
**Concept**: `async` and `await` make asynchronous code look and behave a bit more like synchronous code, improving readability.
```js
async function init(){
    await(createPosts({ title: 'Post Three', body: 'This is post Three'}));
    getPosts();
}
init();
```
---
# Multipromises
Promise.all() allows us to handle multiple promises simultaneously. It resolves when all promises are fulfilled.

---
```js
const promise1 = Promise.resolve('hello world!');
const promise2 = 10;
const promise3 = new Promise( (resolve, reject) => {
    setTimeout(resolve, 2000, 'Goodbye')
});
// the last promise from : https://jsonplaceholder.typicode.com/users
//const promise4 = fetch('https://jsonplaceholder.typicode.com/users');
const promise4 = fetch('https://jsonplaceholder.typicode.com/users').then(
    res => res.json()
);

Promise.all([promise1, promise2, promise3, promise4])
    .then(values => console.log(values));
```
---
# Axios
A promise-based HTTP client for making HTTP requests. It simplifies fetching data and handling responses.

---
```js
function getTodos(){
    //axios.get('https://jsonplaceholder.typicode.com/todos')
    axios({
        method: 'get',
        url: 'https://jsonplaceholder.typicode.com/todos'
    })
    .then((response) => {
      // handle success
      //console.log(response);
      return response.data;
    })
    .then((allusers) => {
        console.log(allusers);
        output = '';
        allusers.forEach(post => {
            //console.log(post.title);
            output += `<p> ${post.title} </p>`
        });
        document.getElementById('output').innerHTML = output;
    })
    .catch((error) => {
      // handle error
      console.log(error);
    });
}

async function getTodos() {
    try {
      const response = await axios.get('https://jsonplaceholder.typicode.com/todos');
      console.log(response);
      // lets continue
      const allposts = await response.data;
      output = '';
      allposts.forEach(post => {
          //console.log(post.title);
          output += `<p> ${post.title} </p>`
      });
      document.getElementById('output').innerHTML = output;
    } catch (error) {
      console.error(error);
    }
}

function addTodo(){
    axios({
        method: 'post',
        url: 'https://jsonplaceholder.typicode.com/todos',
        data: {title: 'New Todo', completed: false}
    })
    .then( (response) => {
        console.log(response.data);
        document.getElementById('output').innerText = JSON.stringify(response.data);
    })
    .catch((error) => {
        // handle error
        console.log(error);
      });
}
```
---
# Fetch
Provides an easy, logical way to fetch resources asynchronously across the network.

---
```js
// pulling text from TEXT file
function getText() {
	//console.log('text file will be here')
	fetch('text.txt')
		.then(function(res){
			return res.text()
		})
		.then(function(data){
			console.log(data);
			document.getElementById('output').innerHTML = data;
		})
		.catch(function(err){
			console.log(err);
		});
}

// pulling data from JSON file
function getJson() {
	fetch('post.json')
		.then(function(res){
			return res.json()
		})
		.then(function(data){
			console.log(data);
			// lets grab json data using loop
			jsonData = "";
			data.forEach(function(element){
				//console.log(element);
				jsonData += `<li><b>${element.title}</b>. ${element.body}</li>`;
			});
			document.getElementById('output').innerHTML = jsonData;
		})
		.catch(function(err){
			console.log(err);
		});
}

// pulling data from External API
function getApi() {
	fetch('https://jsonplaceholder.typicode.com/posts')
		.then(function(res){
			return res.json()
		})
		.then(function(data){
			console.log(data);
			// lets grab json data using loop
			apiData = "";
			data.forEach(function(post, index){
				console.log(post);
				apiData += `<h4>${index+1} ${post.title}</h4> <p>${post.body}</p>`;
			});
			document.getElementById('output').innerHTML = apiData;
		})
		.catch(function(err){
			console.log(err);
		});
}

// posting data to external API
function addPost(){
	let title = document.getElementById('title').value;
	let body = document.getElementById('body').value;

	fetch('https://jsonplaceholder.typicode.com/posts', {
		method: 'POST',
		headers: {
			'Accept': 'application/json, text/plain, */*',
			'Content-type': 'application/json',
			'Origin': 'http://localhost:3000'
		},
		body: JSON.stringify({title: title, body: body})
	})
	.then((res) => res.json())
	.then((data) => console.log(data));
}
```
---
# Conclusion
**Recap**: Understanding and correctly implementing async functions, promises, callbacks, and modern libraries like Axios and Fetch API is crucial for efficient JavaScript programming.

---
# THANKS!!!!!

---
