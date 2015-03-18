## grunt-anon-tasks v0.2.0

**What is this?**

A plugin for [Grunt](http://gruntjs.com/) that allows you to create **anonymous tasks** using `grunt.task.then()`.

**What's an anonymous task?** 

A task that you can run without ever calling `grunt.registerTask()` manually. Anonymous tasks are extremely useful for (1) completion callbacks and (2) dynamic task configuration.

-

#### Table of Contents

&nbsp;&nbsp;&nbsp;&nbsp;
[Installation](#installation)

&nbsp;&nbsp;&nbsp;&nbsp;
[Example](#example)

&nbsp;&nbsp;&nbsp;&nbsp;
[Descriptions](#descriptions)

&nbsp;&nbsp;&nbsp;&nbsp;
[Failability](#failability)

&nbsp;&nbsp;&nbsp;&nbsp;
[Lifecycle](#lifecycle)

-

#### Installation

In your terminal:

```
npm install --save-dev grunt-anon-tasks
```

In your `Gruntfile.js`:

```Javascript
grunt.loadNpmTasks("grunt-anon-tasks")
```

But I suggest using [`load-grunt-tasks`](https://github.com/sindresorhus/load-grunt-tasks):

```Javascript
require("load-grunt-tasks")(grunt) // loads every installed "grunt-*" module
```

-

#### Example

In the example below, the anonymous task runs after `clean` completes and before `build` starts.

```Javascript
grunt.task
  .run("clean")
  .then(function () {
    grunt.log.writeln(this.name)
  })
  .run("build")
```

The `this` variable in anonymous tasks is the same [as in registered tasks](http://gruntjs.com/api/inside-tasks).

-

#### Descriptions

Debugging is easier when an anonymous task has a description. Of course, this is optional.

```Javascript
grunt.task.then("A description of what I'm doing", function () {
  // do cool grunty things
})
```

If provided, the description will appear in your terminal (below the message that says `Running "anon_x" task`).

-

#### Failability

Anonymous tasks can signal failure either synchronously or asynchronously; just like registered tasks.

```Javascript
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

#### Lifecycle

Anonymous tasks are deleted after completion; thus, it isn't possible to run the same anonymous task more than once.
