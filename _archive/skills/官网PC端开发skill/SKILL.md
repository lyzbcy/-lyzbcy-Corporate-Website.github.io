---
name: official-site-dev
description: 公司官网 PC 端（官网仓库，纯静态多页站 + 运行时 i18n）的开发 skill。适用于官网首页/banner/落地页/文案/中英文适配等改动：先读本 skill，再按 docs/ 渐进式披露定位代码落点，最小改动、改完即验证。
---

# 官网 PC 端开发 Skill（归档收藏版）

这是公司官网 PC 端（GitLab `官网仓库`，本地位于
`本地工作区（路径已脱敏）`）的专用开发 skill。
任何 Agent 接手本项目前，先读完本文件，再按需去 `docs/` 深入，不要盲改。

## 第一步：必读

1. `docs/agent.md` —— docs 目录导航，按需渐进式披露
2. `docs/todo.md` —— 当前要做什么、进度到哪
3. 对应需求文档 `docs/requirements/<日期>-*.md`

## 第二步：按改动类型读 reference

| 改什么 | 先读 |
| --- | --- |
| 首页 banner / 首屏宣传位 | `docs/reference/homepage-banner.md` |
| 任何文案（含中英文） | `docs/reference/i18n.md` |
| 跑不起来 / 本地预览 | `docs/project.md` 的「本地预览」节 |
| 分支、提交、MR | `docs/project.md` 的「分支与提交规范」节 |
| 提测前打包 / 查这次改了哪些文件 | `docs/reference/change-log.md`（变更文件数据库） |

## 完成定义（DoD）

开发完成的标志，缺一不可：

1. 浏览器实测通过（中英文各一遍），必要时截图与设计稿比对
2. **`docs/reference/change-log.md` 数据库补一行**：新增/修改的每个文件都记录（增量打包给后端靠它防遗漏）
3. 受影响入口页直连资源 `?v=` 递增，`docs/project.md` 版本记录补一行
4. `docs/todo.md` 勾掉对应项；需求文档标注状态
5. 全部改动保持未提交，等用户 CR

## 开发铁律

1. 纯静态多页站：入口 HTML + `css/` + `js/` + `i18n/`，先定位最小落点再改
2. 文案必须走 i18n key，zh/en 两个语言包同步改，HTML 默认值同步改
3. 图片按日期归档到 `image/index-banner/<yyyymmdd>/`
4. 改完 `npm run preview:local` 立即验证，中英文各看一遍，链接点击实测
5. 上线前递增受影响入口页直连资源的 `?v=` 版本号，并在 `docs/project.md` 版本记录补一行
6. 需求完成后更新 `docs/todo.md`；旧 slide 用注释保留历史
7. 所有修改保持未提交状态；git add/commit/push 和 MR 需用户分别同意
8. 远程是内网 GitLab（需 VPN）；clone 后远端 HEAD 异常时手动 checkout `origin/master`

## 通用守则

配合 `lyzbcy-official-website-development-manual`（官网2.0开发手册）使用：最小改动、保运行时行为、先验证、留证据。
