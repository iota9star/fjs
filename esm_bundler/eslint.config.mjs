import globals from 'globals';
import tsParser from '@typescript-eslint/parser';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import js from '@eslint/js';
import { FlatCompat } from '@eslint/eslintrc';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const compat = new FlatCompat({
  baseDirectory: __dirname,
  recommendedConfig: js.configs.recommended,
  allConfig: js.configs.all,
});

export default [{
  ignores: ['**/dist'],
}, ...compat.extends('eslint:recommended', 'plugin:@typescript-eslint/recommended'), {
  languageOptions: {
    globals: {
      ...globals.browser,
      ...globals.jest,
      ...globals.node,
    },

    parser: tsParser,
  },

  rules: {
    '@typescript-eslint/no-explicit-any': 'off',
    '@typescript-eslint/ban-types': 'off',
    'arrow-parens': ['error', 'always'],

    quotes: ['error', 'single', {
      avoidEscape: true,
    }],

    semi: ['error', 'always'],

    'prefer-const': [2, {
      ignoreReadBeforeAssign: false,
    }],

    'object-curly-spacing': ['error', 'always'],
    'no-undef': 'off',
    'no-prototype-builtins': 'off',
  },
}];