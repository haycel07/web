# 汤启琛个人网站 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 创建一个可直接通过 GitHub Pages 发布、面向研究与教育机会的中文个人网站。

**Architecture:** 无构建步骤的静态单页。index.html 只承载语义化内容，assets/css/site.css 负责响应式编辑感视觉和动效，assets/js/site.js 只负责导航高亮、进场动效状态与联系链接保护。网站不调用后端或第三方服务。

**Tech Stack:** HTML5、CSS3、原生 JavaScript、GitHub Pages。

---

## 文件结构

- `index.html`：主页面与真实经历内容。
- `assets/css/site.css`：设计令牌、版面、响应式规则、可访问性与动效降级。
- `assets/js/site.js`：菜单状态、页面入场与外链微交互。
- `README.md`：本地预览、替换资料、GitHub Pages 发布指南。
- `.gitignore`：忽略本地 brainstorming 协作文件。

### Task 1: 建立静态站点与内容骨架

**Files:**
- Create: `D:/Desktop/过度/index.html`
- Create: `D:/Desktop/过度/assets/css/site.css`
- Create: `D:/Desktop/过度/assets/js/site.js`

- [ ] **Step 1: 写出内容验收检查并先运行，使其失败**

Run:

```powershell
$html = Get-Content -Raw 'index.html'
@('汤启琛','2025','大创','全国中学生生物竞赛二等奖','2026','微信小程序','生命科学','教育','数字工具') | ForEach-Object { if ($html -notmatch [regex]::Escape($_)) { throw "缺少：$_" } }
```

Expected: 失败，提示找不到 `index.html`。

- [ ] **Step 2: 创建最小语义化页面**

创建 `index.html`，包含 `<header>`、`<main>`、`<section id="trajectory">`、`<section id="map">`、`<section id="about">`、`<footer>`；在轨迹区逐字写入：

```text
2025 大学生创新创业训练计划省赛入围
全国中学生生物竞赛二等奖
2026 全国微信小程序开发者选手
```

在 `<head>` 中引用 `assets/css/site.css`，文末加载 `assets/js/site.js`。联系人区只提供 `mailto:` 与 GitHub 的可替换提示，且不填入虚构账号。

- [ ] **Step 3: 重新运行内容验收检查**

运行 Step 1 的命令。

Expected: 无输出错误。

- [ ] **Step 4: 提交内容骨架**

```powershell
git add index.html assets/css/site.css assets/js/site.js
git commit -m "feat: add personal site structure"
```

Expected: 创建站点结构提交。

### Task 2: 实现编辑感响应式视觉

**Files:**
- Modify: `D:/Desktop/过度/assets/css/site.css`
- Modify: `D:/Desktop/过度/index.html`

- [ ] **Step 1: 写出视觉与无障碍检查并先运行，使其失败**

```powershell
$css = Get-Content -Raw 'assets/css/site.css'
@(':root','@media (max-width:','prefers-reduced-motion','focus-visible') | ForEach-Object { if ($css -notmatch [regex]::Escape($_)) { throw "缺少 CSS 规则：$_" } }
```

Expected: 失败，提示缺少设计令牌或响应式规则。

- [ ] **Step 2: 编写设计令牌和版面规则**

在 `site.css` 建立暖白、深墨和低饱和青绿 CSS 变量；采用中文衬线标题与系统中文正文回退；实现编号时间线、三方向地图、细线分隔与移动端单列布局。为链接、按钮设置明显 `:focus-visible` 样式，并在 `@media (prefers-reduced-motion: reduce)` 中停用动画和过渡。

在 `index.html` 为导航与跳过链接补齐可访问名称；各项目卡片使用可读的标题、年份、摘要，而非只用颜色传达意义。

- [ ] **Step 3: 运行视觉与无障碍检查**

运行 Step 1 的命令。

Expected: 无输出错误。

- [ ] **Step 4: 提交视觉实现**

```powershell
git add index.html assets/css/site.css
git commit -m "feat: style editorial research portfolio"
```

Expected: 创建视觉实现提交。

### Task 3: 添加渐进交互与本地验证

**Files:**
- Modify: `D:/Desktop/过度/assets/js/site.js`
- Create: `D:/Desktop/过度/.gitignore`

- [ ] **Step 1: 写出交互验收检查并先运行，使其失败**

```powershell
$js = Get-Content -Raw 'assets/js/site.js'
@('DOMContentLoaded','IntersectionObserver','is-visible') | ForEach-Object { if ($js -notmatch [regex]::Escape($_)) { throw "缺少脚本行为：$_" } }
```

Expected: 失败，提示脚本尚未实现。

- [ ] **Step 2: 实现非阻塞交互**

在 `site.js` 中于 `DOMContentLoaded` 后：为导航链接监听滚动并切换 `aria-current="page"`；用 `IntersectionObserver` 为带 `.reveal` 的元素添加 `is-visible`；浏览器不支持该 API 时直接显示元素。不得阻断内容阅读或依赖 JavaScript 才能看到关键信息。

创建 `.gitignore`：

```gitignore
.superpowers/
```

- [ ] **Step 3: 运行脚本检查和本地预览**

```powershell
$js = Get-Content -Raw 'assets/js/site.js'
@('DOMContentLoaded','IntersectionObserver','is-visible') | ForEach-Object { if ($js -notmatch [regex]::Escape($_)) { throw "缺少脚本行为：$_" } }
Start-Process 'index.html'
```

Expected: 输出无错误并在浏览器显示完整站点。

- [ ] **Step 4: 提交交互与忽略规则**

```powershell
git add assets/js/site.js .gitignore
git commit -m "feat: add accessible site interactions"
```

Expected: 创建交互实现提交。

### Task 4: 编写发布说明并初始化 GitHub 仓库

**Files:**
- Create: `D:/Desktop/过度/README.md`
- Modify: `D:/Desktop/过度/.gitignore`

- [ ] **Step 1: 写出 README 结构检查并先运行，使其失败**

```powershell
$readme = Get-Content -Raw 'README.md'
@('GitHub Pages','Settings','Pages','联系信息') | ForEach-Object { if ($readme -notmatch [regex]::Escape($_)) { throw "缺少说明：$_" } }
```

Expected: 失败，提示找不到 `README.md`。

- [ ] **Step 2: 编写发布说明**

创建 `README.md`，精确说明：初始化仓库；在 GitHub 创建空仓库；添加 `origin`；推送 `main`；进入仓库 `Settings → Pages`，选择 `Deploy from a branch`、`main` 和 `/(root)`；保存后等待站点地址生成。另列出在 `index.html` 中替换邮箱和 GitHub 链接的位置。

- [ ] **Step 3: 运行 README 结构检查**

运行 Step 1 的命令。

Expected: 无输出错误。

- [ ] **Step 4: 初始化并提交仓库**

```powershell
git init -b main
git add .
git commit -m "feat: publish Tang Qichen personal site"
```

Expected: `main` 分支存在且工作区干净。

### Task 5: 发布后核验

**Files:**
- Verify: GitHub Pages URL

- [ ] **Step 1: 推送到用户创建的 GitHub 空仓库**

```powershell
git remote add origin https://github.com/USERNAME/REPOSITORY.git
git push -u origin main
```

Expected: 远端 `main` 分支显示网站文件。

- [ ] **Step 2: 在 GitHub Pages 设置启用 branch 部署**

在 GitHub 仓库依次选择 `Settings → Pages → Deploy from a branch → main → /(root) → Save`。

Expected: 页面显示已发布的 URL。

- [ ] **Step 3: 在公开 URL 验证关键内容**

打开生成的网址，确认主标题“汤启琛”、三项经历、各锚点导航与移动布局均可正常显示。

- [ ] **Step 4: 记录发布 URL**

在 README 顶部添加实际 GitHub Pages URL，然后：

```powershell
git add README.md
git commit -m "docs: add deployed site URL"
git push
```

Expected: README 链接与已上线站点一致。

