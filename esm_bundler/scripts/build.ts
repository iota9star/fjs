import * as fs from 'node:fs';
import path from 'node:path';
import { rollup } from 'rollup';
import esbuild from 'rollup-plugin-esbuild';
import json from '@rollup/plugin-json';
import commonjs from '@rollup/plugin-commonjs';
import nodeResolve from '@rollup/plugin-node-resolve';
import polyfillNode from 'rollup-plugin-polyfill-node';


const outputRoot = 'dist';
const inputRoot = 'src';

const plugins = [
  json(),
  commonjs(),
  nodeResolve(),
  polyfillNode(),
  esbuild({
    target: 'es2020',
    sourceMap: false,
    minify: true,
  }),
];

async function build() {
  const root = path.join(inputRoot, 'module');
  fs.mkdirSync(outputRoot, { recursive: true });
  const files = fs.readdirSync(root);
  for (let file of files) {
    let input = path.join(root, file);
    const build = await rollup({
      input,
      plugins,
    });
    let fileName = `${file.substring(0, file.length - 3)}.js`;
    const bundle = await build.generate({
      file: fileName,
      format: 'esm',
    });
    await build.close();
    fs.writeFileSync(path.join(outputRoot, fileName), bundle.output[0].code);
  }
}


async function main() {
  fs.rmSync(outputRoot, { recursive: true, force: true });
  fs.mkdirSync(outputRoot, { recursive: true });
  await build();
}

main();