
module.exports = (grunt) ->

	{ Task } = grunt.util.task

	Task::then = (description, task) ->

		# Create a unique, anonymous name.
		name = "anon_" + _index++

		# Make the description optional.
		if description instanceof Function
			task = description
			description = null

		# Register and queue the anonymous task.
		grunt
			.registerTask name, description, ->
				delete grunt.task._tasks[name]
				return task.call this
			.run name

		# Make it chainable!
		return this

	####################################
	####################################

	_index = 0

	return
