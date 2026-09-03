# 项目介绍：官网仓库（公司官网 PC 端）

- 仓库：内网 GitLab（仓库地址已脱敏）
- 主分支：`master`（远端 HEAD 异常时手动 `git checkout -b master origin/master`）
- 手机端仓库为另一个项目：移动端官网仓库

## 技术栈

纯静态多页站点（HTML + CSS + jQuery + Bootstrap 轮播 + Swiper），Gulp 做构建压缩，无框架、无打包时编译。

- 页面：根目录 `index.html` + `page/*.html`
- 样式：`css/`，脚本：`js/`，公共资源：`common/`
- 国际化：`i18n/i18n.js` 运行时替换，文案在 `i18n/common.zh.js` / `common.en.js`（站点级）和 `i18n/pages/<页面名>.zh.js` / `.en.js`（页面级），HTML 里用 `data-i18n`、`data-i18n-src`、`data-i18n-title` 等属性挂 key
- 图片按日期归档：`image/index-banner/<日期>/`

## 本地预览

```bash
npm run preview:local   # node local-preview-server.js
```

## 分支与提交规范

- 分支：做需求 `feat-xxx`，修 bug `hotfix-xxx`；公司发布另有 release 流程
- 提交：约定式提交 V1.0.0（`feat:` / `fix:` / `docs:` / `style:` / `refactor:` / `chore:`）
- git 同步（add/commit/push）和 MR 需用户分别同意，禁止 AI 主动提交

## 版本记录（缓存刷新）

静态资源带 `?v=N` 版本号，改动上线时要递增对应入口页的版本号，避免命中旧缓存。

| 日期 | 变更 |
| --- | --- |
| 2026-08-31 | master: 替换首页视频播放地址（ea627805） |
| 2026-09-02 | 首页 slide1 banner 换 WorkBuddy × SCRM Skill × 企微 CLI 宣传并按成图校准排版（`css/index.css` ?v=9，`i18n/pages/index.*.js` ?v=3，`i18n/pages/about.*.js` ?v=2）；无锡地址+精确坐标更新。**已上线（2026-09-02 推生产，commit 8b18e422）**。明细见 `reference/change-log.md` |
