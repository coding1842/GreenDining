import path from 'path';
import webpack from 'webpack';
import MiniCssExtractPlugin from 'mini-css-extract-plugin';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

export default {
   entry:{
         index : './src/main/resources/static/Main.js',
//         requestApi: './src/main/resources/static/js/requestApi.js'
    },
     output: {
         path: path.resolve(__dirname, 'src/main/resources/static/dist/bundle'),
         filename: 'bundle.js'
    },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
        ],
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
                      presets: ['@babel/preset-env']
                    },
        },
      },
    ],
  },
  plugins: [
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
    }),
    new MiniCssExtractPlugin({
          filename: 'bundle.css',
        }),
  ],
};

