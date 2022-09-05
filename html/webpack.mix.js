const mix = require('laravel-mix');

mix.js('resources/js/app.js', 'public/js')
    .browserSync({
        proxy: 'php',
        files: [
            './resources/**/*',
            './public/**/*',
        ],
        open: false,
        reloadOnRestart: true,
    });