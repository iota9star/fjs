module.exports = {
  transform: {
    '^.+\\.(t|j)sx?$': 'esbuild-jest',
  },
  testTimeout: 60 * 1000,
};
