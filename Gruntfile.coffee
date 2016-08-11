module.exports = (grunt) ->
  grunt.initConfig {
    sass: {
      dist: {
        options: {
          loadPath: ['node_modules/foundation-sites/scss'],
          sourcemap: 'none',
          style: 'expanded'
        },
        files: [{
          expand: true,
          cwd: 'app/assets/sass',
          src: ['**/*.scss'],
          dest: 'app/assets/css',
          ext: '.css'
        }]
      }
    },

    coffee: {
      glob_to_multiple: {
        expand: true,
        flatten: true,
        cwd: 'app/assets/coffee',
        src: ['**/**.coffee'],
        dest: 'app/assets/js',
        ext: '.js'
      }
    },

    concat: {
      options: {
        separator: ';'
      },
      css: {
        src: ['app/assets/css/**/*.css'],
        dest: 'app/public/css/application.css'
      },
      js: {
        src: ['app/assets/js/**/*.js'],
        dest: 'app/public/js/application.js'
      }
    },

    watch: {
      options: {
        cwd: 'app/assets'
      },
      coffee: {
        files: ['coffee/**/*.coffee'],
        tasks: ['coffee', 'concat']
      },
      sass: {
        files: ['sass/**/*.scss'],
        tasks: ['sass', 'concat']
      }
    }
  }

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['sass', 'coffee', 'concat']
