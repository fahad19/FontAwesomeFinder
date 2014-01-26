module.exports = (grunt) ->

  ##
  # Config
  #
  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
      '*/\n'

    less:
      app:
        options:
          compress: false
          paths: [
            'css'
            'vendors'
          ]
        files:
          'css/app.css': 'css/app.less'

    cssmin:
      app:
        files:
          'css/app.css': ['css/app.css']

    coffee:
      app:
        files:
          'tmp/app.js': 'js/app.coffee'

    concat:
      options:
        banner: '<%= banner %>'
      js:
        src: [
          'tmp/icons.js'
          'vendors/angular/angular.js'
          'tmp/app.js'
        ]
        dest: 'js/app.js'

    uglify:
      options:
        mangle: false
      app:
        files:
          'js/app.js': ['js/app.js']

    watch:
      app:
        files: [
          'css/app.less'
          'js/app.coffee'
        ]
        tasks: ['build']

    clean:
      tmp:
        files: [{
          dot: true
          src: [
            'tmp'
          ]
        }]


  ##
  # Load plugins
  #
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  ##
  # Custom tasks
  #
  grunt.registerTask 'iconsData', () ->
    varsPath  = __dirname + '/vendors/font-awesome/less/variables.less'
    content   = grunt.file.read varsPath, encoding: 'utf8'
    varsLines = content.split "\n"

    data    = grunt.file.readJSON 'data.json'
    faNames = []

    # add/update
    for k, v of varsLines
      line    = v.split ':'
      varName = line[0].replace '@', ''
      if varName.indexOf('fa-var') is -1
        continue

      faName  = varName.replace 'fa-var-', 'fa-'
      if !faName? and faName.length is 0
        continue

      faNames.push faName
      if !data[faName]?
        data[faName] =
          name: faName
          keywords: []

    # remove
    for k, v of data
      if faNames.indexOf(k) is -1
        delete data[k]

    # write JSON
    write = JSON.stringify data, null, 2
    grunt.file.write 'data.json', write

    # write JS
    grunt.file.write 'tmp/icons.js', 'var icons = ' + write + ';'

  ##
  # Tasks
  #
  grunt.registerTask 'build', [
    'clean:tmp'
    'iconsData'
    'less:app'
    'coffee:app'
    'concat:js'
    'cssmin:app'
    'uglify:app'
  ]
  grunt.registerTask 'default', ['build']
