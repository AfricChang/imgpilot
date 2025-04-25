/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    optimizePackageImports: ['@excalidraw/excalidraw'],
    swcMinify: true
  },
  // 允许静态资源导入
  images: {
    unoptimized: true,
    disableStaticImages: true
  },
  // 配置静态资源路径
  assetPrefix: process.env.NODE_ENV === 'production' ? '.' : '',
  // 禁用字体优化，避免字体加载问题
  optimizeFonts: false,
  // 配置webpack以处理特殊路径
  webpack: (config, { isServer }) => {
    // 确保/ledoc和/vercel路径能被正确处理
    config.resolve = config.resolve || {};
    config.resolve.alias = {
      ...config.resolve.alias,
      '/ledoc': '/.next/static',
      '/vercel': '/.next/static',
    };
    return config;
  },
};

module.exports = nextConfig;
