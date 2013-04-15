cors = require('connect-cors')

module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    connect:
      server:
        options:
          port: 9001,
          base: ''
          keepalive: true
          middleware: (connect, options) -> [
            cors({})
            connect.static(options.base)
            connect.directory(options.base)
          ]


  grunt.loadNpmTasks('grunt-contrib-connect')