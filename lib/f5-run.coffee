{exec} = require 'child_process'
path = require 'path'

module.exports =
  activate: ->
    atom.commands.add('atom-workspace', 'run', () => this.run());

  run: ->
    cwd = atom.project.getPaths()
    cwd = cwd[0] if Array.isArray(cwd)
    run = require("#{cwd}/package.json").scripts.run

    exec run, cwd:cwd, (error, stdout, stderr) ->
      if error
        alert "#{error}:\n\ncwd:#{cwd}\n\nrun:#{run}"
