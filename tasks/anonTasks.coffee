
__anon__ = "__anon__"

module.exports = (grunt) ->

	{ Task } = grunt.util.task

	Task::then = ($1, $2) ->
		$2 = $1 if !$2?

		if $2 instanceof Function
			info = $1
			fn = $2
			grunt.registerTask __anon__, ->
				delete grunt.task._tasks[__anon__]
				grunt.verbose.writeln "\n" + info
				return task.call this
			grunt.task.run __anon__

		else if $2 instanceof Object
			task = $1
			opts = $2
			grunt.config.set task + "." + __anon__, options
			grunt.task.run task + ":" + __anon__
			grunt.task.then -> grunt.config.set task + "." + __anon__, undefined

		return this

	_index = 0

	return
