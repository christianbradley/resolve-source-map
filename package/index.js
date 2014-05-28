// Generated by CoffeeScript 1.6.3
(function() {
  var SourceMap;

  SourceMap = require('source-map');

  exports.resolve = function(path, line, column, callback) {
    return require('fs').readFile(path, 'utf8', function(error, data) {
      var consumer, mapping, query;
      if (error != null) {
        return callback(error);
      }
      try {
        consumer = new SourceMap.SourceMapConsumer(data);
        query = {
          line: parseInt(line),
          column: parseInt(column)
        };
        mapping = consumer.originalPositionFor(query);
      } catch (_error) {
        error = _error;
        return callback(error);
      }
      return callback(null, mapping);
    });
  };

}).call(this);

/*
//@ sourceMappingURL=index.map
*/