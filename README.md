
# grunt-then v1.0.0

Schedule a `Function` to be called without ever registering it via `grunt.registerTask`. This is called an **anonymous task**.

```JavaScript
grunt
  .run("coffee")
  .then(function () {
    console.log(this.name)
  })
```

As seen above, the `this` context in anonymous tasks is [just like in normal tasks](http://gruntjs.com/api/inside-tasks).

-

Plus, you can fail an anonymous task early (just like in normal tasks).

```JavaScript
grunt.task
  .then(function () {
    return false // synchronous failure
  })
  .then(function () {
    var done = this.async()
    performAsyncOperation(function () {
      done(false) // asynchronous failure
    })
  })
```

-

Debugging is easier when an anonymous task has a description. Of course, this is optional.

```Javascript
grunt.task.then("A description of what I'm doing", function () {
  // do cool grunty things
})
```

If the `--verbose` flag is used and a description is provided, it will be printed when the anonymous task starts.

-

Schedule an existing task to be called with a single-use configuration. This is called an **anonymous target**.

```JavaScript
grunt.then("clean", {
  // Calls the 'clean' task with temporary configuration (after the previous task completes).
})
```

install
-------

```sh
npm install --save-dev grunt-then
```

In your Gruntfile:

```Javascript
grunt.loadNpmTasks("grunt-then")
```

Use [`load-grunt-tasks`](https://github.com/sindresorhus/load-grunt-tasks) when you have more than one NPM task to load.
