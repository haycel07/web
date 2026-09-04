# 汤启琛｜个人网站

面向研究与教育机会的静态个人网站，可免费部署至 GitHub Pages。

## 本地预览

直接用浏览器打开 `index.html`，或在该目录运行：

```powershell
Start-Process index.html
```

## 更新联系信息

打开 `index.html`，在最底部的 `.contact` 区域替换：

- `chihayaceleste@qq.com` 为你的常用联系邮箱；
- `https://github.com/` 为你的 GitHub 主页链接，并把“GitHub（待更新）”改为你的用户名。

## 发布到 GitHub Pages

1. 登录 GitHub，创建一个空仓库，例如 `personal-site`；不要选择自动生成 README。
2. 在本地项目根目录运行下列命令，把 `YOUR-ACCOUNT` 和 `personal-site` 换成实际信息：

   ```powershell
   git remote add origin https://github.com/YOUR-ACCOUNT/personal-site.git
   git push -u origin site-build:main
   ```

3. 打开 GitHub 仓库的 `Settings` → `Pages`。
4. 在 **Build and deployment** 中选择 **Deploy from a branch**，分支选择 `main`，文件夹选择 `/(root)`，然后保存。
5. 等待 GitHub Pages 生成网址；通常形如 `https://YOUR-ACCOUNT.github.io/personal-site/`。

## 验证

发布后打开 GitHub Pages 链接，确认首页展示“汤启琛”、三项经历和导航锚点。若修改内容，提交后再次 `git push` 即可更新。
