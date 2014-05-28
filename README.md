resolve-source-map
================================================================================

A simple utility to resolve source maps.

Installation
--------------------------------------------------------------------------------

For [nodejs] via [npm]:

```sh
npm install resolve-source-map
```

Or, install globally (recommended):

```sh
npm install resolve-source-map -g
```


Resolving via the executable
--------------------------------------------------------------------------------
A simple shell script is provided with the package. To use it, you should install the package globally (see [Installation]).

```sh
resolve-source-map path-to-map-file line-number column-number
```

### Tests for executable

    cmd = './node_modules/.bin/resolve-source-map ./test/test.map 8 22'

    require('child_process').exec cmd, (error, stdout, stderr) ->
      throw error if error?
      assert.equal "test.coffee:4:12\n", stdout
      assert.equal "", stderr

---


Resolving via the API
--------------------------------------------------------------------------------

Require the module:

    ResolveSourceMap = require('resolve-source-map')

We'll use the `assert` library to demonstrate:

    assert = require 'assert'

Call the `resolve` method, passing in the `path` to the `.map` file, the `line` number and `column` number, followed by a `callback` to handle the results:

The following demonstrates this functionality, using the `test.map` and `test.coffee` files located in this package:

    ResolveSourceMap.resolve './test/test.map', 8, 22, (error, mapping) ->
      assert.equal 'test.coffee', mapping.source
      assert.equal 4, mapping.line
      assert.equal 12, mapping.column

[nodejs]: http://nodejs.org
[npm]: http://npmjs.org
[installation]: #installation
