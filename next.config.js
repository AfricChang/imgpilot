/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    optimizePackageImports: ['@excalidraw/excalidraw']
  },
  optimizeFonts: false
};

module.exports = nextConfig;
