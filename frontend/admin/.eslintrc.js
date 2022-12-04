module.exports = {
  // ... your existing config
  settings: {
    'import/resolver': {
      alias: {
        map: [
          // And all your import aliases
          ['@/*', 'src/*'],
          ['@components', './src/components'],
          ['@constants', './src/onstants'],
          ['@pages', './src/pages'],
          ['@store', './src/store'],
          ['@assets', './src/assets'],
          ['@images', './src/assets/img'],
          ['@icons', './src/assets/icons'],
        ],
        extensions: ['.ts', '.js', '.jsx', '.json'],
      },
    },
  },
  "parserOptions": {
    "ecmaVersion": "latest"
  },

  "env": {
    "es6": true
  }
};