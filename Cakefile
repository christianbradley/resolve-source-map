async = require 'async'
MODULE_NAME = require('./package.json').name
logger = console

exec = (command, callback) ->
  logger.log "> #{command}"
  proc = require('child_process').exec command
  proc.stdout.pipe process.stdout
  proc.stderr.pipe process.stderr

  proc.on 'error', (error) ->
    logger.error 'An error occurred', error
    callback error if callback?

  proc.on 'exit', (code, signal) ->
    if code is 0
      callback null, code
    else
      callback new Error("Process exited with code: #{code}")

linkToGlobal = (done) ->
  exec 'npm link', done

linkLocally = (done) ->
  exec "npm link #{MODULE_NAME}", done

compile = (done) ->
  exec "coffee --compile --map --output ./package/ ./coffee/*.coffee", done

test = (done) ->
  exec "coffee --literate README.md", done

task 'compile', ->
  compile (error) -> throw error if error?

task 'link', ->
  async.series [linkToGlobal, linkLocally], (error) -> throw error if error?
  
task 'build', ->
  async.series [compile, linkToGlobal, linkLocally, test], (error) ->
    if error
      logger.error error
      process.exit 1
