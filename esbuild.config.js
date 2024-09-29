// esbuild.config.js
const esbuild = require('esbuild');
const sassPlugin = require('esbuild-sass-plugin').sassPlugin;

// Configure watch mode if specified in the command line
const isWatchMode = process.argv.includes('--watch');

const buildOptions = {
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  sourcemap: true,
  format: 'esm',
  outdir: 'app/assets/builds/js',
  publicPath: '/assets/js',
  plugins: [sassPlugin()],
  loader: {
    '.woff': 'file',
    '.woff2': 'file',
    '.png': 'file',
    '.svg': 'file',
    '.ttf': 'file',
    '.eot': 'file'
  }
};

if (isWatchMode) {
  // Enable watch mode with esbuild's native watcher
  esbuild.context(buildOptions).then(ctx => {
    console.log("Watching for changes...");
    return ctx.watch();
  }).catch(() => process.exit(1));
} else {
  // Run a one-time build
  esbuild.build(buildOptions).catch(() => process.exit(1));
}