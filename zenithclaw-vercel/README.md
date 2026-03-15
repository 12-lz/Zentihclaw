# Zenithclaw - Vercel 部署指南

## 📦 文件清单

✅ index.html - 主网页文件
✅ logo.png - Logo图片
✅ qrcode_inverted.jpg - 二维码图片（反色处理）
✅ vercel.json - Vercel 配置文件

## 🚀 部署步骤

### 方法一：通过 Vercel CLI（推荐）

1. **安装 Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **在项目目录打开终端**
   ```bash
   cd D:\zenithclaw-vercel
   ```

3. **登录 Vercel**
   ```bash
   vercel login
   ```

4. **部署到生产环境**
   ```bash
   vercel --prod
   ```

完成！你会得到一个类似 `https://zenithclaw.vercel.app` 的链接。

---

### 方法二：通过 Vercel Dashboard（可视化部署）

1. 访问 [vercel.com](https://vercel.com)
2. 登录账号
3. 点击 "Add New" → "Project"
4. 上传或导入这个文件夹
5. 点击 "Deploy"

---

### 方法三：通过 Git（推荐用于长期维护）

1. **初始化 Git 仓库**
   ```bash
   cd D:\zenithclaw-vercel
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. **推送到 GitHub**
   ```bash
   # 在 GitHub 创建新仓库后
   git remote add origin https://github.com/你的用户名/zenithclaw.git
   git branch -M main
   git push -u origin main
   ```

3. **在 Vercel 导入项目**
   - 在 Vercel Dashboard 点击 "Import Project"
   - 选择你的 GitHub 仓库
   - 点击 "Deploy"

---

## ✨ 功能清单

- ✅ 响应式单页滚动设计
- ✅ 5个完整section页面
- ✅ 平滑滚动导航
- ✅ 右侧导航指示器
- ✅ 动态背景动画
- ✅ "联系我们"弹窗（含二维码）
- ✅ 能力卡片六边形布局
- ✅ 3D卡片翻转效果
- ✅ 消息渠道滚动条

---

## 🔧 自定义配置

如需修改网站内容，编辑 `index.html` 文件即可：
- 修改文字内容
- 调整样式（CSS在 `<style>` 标签中）
- 更换图片（替换 `logo.png` 或 `qrcode_inverted.jpg`）

---

## 📞 技术支持

如有问题，请检查：
1. 所有文件是否在同一目录
2. 图片路径是否正确
3. 浏览器控制台是否有错误信息（F12）

---

**部署后，你的网站将在几分钟内全球可访问！🌍**
