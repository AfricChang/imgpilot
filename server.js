const express = require('express');
const next = require('next');
const path = require('path');

// 确保 NODE_ENV 被正确设置
const dev = process.env.NODE_ENV !== 'production';
const app = next({ dev });
const handle = app.getRequestHandler();
const port = process.env.PORT || 3000;

// 捕获未处理的异常
process.on('uncaughtException', (err) => {
  console.error('Uncaught Exception:', err);
});

// 捕获未处理的 Promise 错误
process.on('unhandledRejection', (reason, promise) => {
  console.error('Unhandled Rejection at:', promise, 'reason:', reason);
});

app.prepare()
  .then(() => {
    const server = express();

    // 处理静态资源路径
    server.use('/_next', express.static(path.join(__dirname, '.next')));

    // 处理所有 Next.js 路由
    server.all('*', (req, res) => {
      return handle(req, res);
    });

    server.listen(port, (err) => {
      if (err) {
        console.error('Failed to start server:', err);
        process.exit(1);
      }
      console.log(`> Ready on http://localhost:${port}`);
    });
  })
  .catch((err) => {
    console.error('Failed to prepare Next.js app:', err);
    process.exit(1);
  });