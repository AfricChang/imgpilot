# Windows 打包说明

本目录包含用于将项目打包成 Windows 可执行文件的脚本。

## 环境要求

- Python 3.9 或更高版本
- PyInstaller (`pip install pyinstaller`)
- 项目所需的所有依赖已安装

## 打包命令

### build.bat 支持以下参数：

- `-CPU`: 构建 CPU 版本
- `-GPU`: 构建 GPU 版本（默认选项）

示例：

这将清理以下内容：
- build/ 目录（构建临时文件）
- dist/ 目录（构建输出）
- __pycache__ 目录（Python 字节码缓存）

## 注意事项

1. 确保在运行打包脚本前已安装所有必要的依赖
2. 打包过程可能需要几分钟时间，请耐心等待
3. 如果遇到打包错误，可以尝试先运行 clean.bat 清理构建文件，然后重新打包