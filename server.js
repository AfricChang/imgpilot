/** @type {import('next').NextConfig} */
const nextConfig = {
    experimental: {
      optimizePackageImports: ['@excalidraw/excalidraw'],
      swcMinify: true,
    },
    images: {
      unoptimized: true,
      disableStaticImages: true,
    },
    assetPrefix: '.', // 固定为相对路径
    optimizeFonts: false,
    webpack: (config) => {
      config.resolve = config.resolve || {};
      config.resolve.alias = {
        ...config.resolve.alias,
        '/ledoc': path.resolve(__dirname, './.next/static'),
        '/vercel': path.resolve(__dirname, './.next/static'),
      };
      return config;
    },
  };
  
  module.exports = nextConfig;