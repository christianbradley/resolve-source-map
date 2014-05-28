SourceMap = require 'source-map'

exports.resolve = (path, line, column, callback) ->

  require('fs').readFile path, 'utf8', (error, data) ->
    return callback(error) if error?

    try
      consumer = new SourceMap.SourceMapConsumer data
      query = line: parseInt(line), column: parseInt(column)
      mapping = consumer.originalPositionFor query

    catch error
      return callback(error)

    callback null, mapping
