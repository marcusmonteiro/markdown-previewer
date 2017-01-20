require('sanitize.css/sanitize.css')
require('./main.css')
require('materialize-css/dist/css/materialize.min.css')

require('materialize-css/dist/js/materialize.min.js')

var Elm = require('./Main.elm')

var root = document.getElementById('root')

Elm.Main.embed(root)
