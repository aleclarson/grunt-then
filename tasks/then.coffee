
module.exports = (Grunt) ->

	{ Task } = Grunt.util.task

	Task::then = ($1, $2) ->

		if typeof $1 isnt "string"
			$2 = $1
			$1 = null

		if $2 instanceof Function
			id = "anonymous_task"
			info = $1
			fn = $2
			Grunt.registerTask id, ->
				delete Grunt.task._tasks[id]
				Grunt.verbose.writeln "\n" + info if info?
				return fn.apply this, arguments
			Grunt.task.run id

		else if $2 instanceof Object
			id = "anonymous_target"
			task = $1
			config = $2
			Grunt.config.set task + "." + id, config
			Grunt.task.run task + ":" + id
			Grunt.task.then -> Grunt.config.set task + "." + id, undefined

		return this

	return null
