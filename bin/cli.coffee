#!/usr/bin/env coffee
resolve = require('../').resolve
args = process.argv.slice 2

if args.length is 3
  [path, line, column] = args
  resolve path, line, column, (error, map) ->
    throw error if error?
    console.log "#{map.source}:#{map.line}:#{map.column}"

else
  console.log "Usage: resolve-source-map path line column"
  process.exit 1
