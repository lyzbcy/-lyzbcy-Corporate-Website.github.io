---
title: MiniPreview 审片工具增强
subtitle: 给开源审片工具补上"记忆"，并把增强回馈上游（PR #1）
category: team
tags: [团队项目, 开源贡献, 视频审片, AI漫剧, 效率]
featured: false

caption:
  title: MiniPreview+
  subtitle: Open-source Contribution to a Video Review Tool
  thumbnail: assets/img/作品集/minipreview/cover.png
total_score: 81.2
score_value: 86
score_difficulty: 76
score_completeness: 90
score_innovation: 72
score_maintainability: 76
score_review: "上游是同事阿沛的开源审片工具 MiniPreview，缺本地记忆导致刷新丢批注。我们补上了多根工作区、最近打开、批注 IndexedDB 持久化、会话恢复、ZIP 导入导出等完整记忆体系，修了 5 个 bug，并把剔除内部功能后的版本作为 PR #1 回馈上游。价值按团队真实每天在用计；难度创新按个人增量计分——难点集中在零依赖单文件约束下的 File System Access 句柄持久化与手写 ZIP 引擎，架构上单文件已 4600 行接近可维护性上限。"
score_model: "GLM-5.3"
---

<div class="q-bounce-content" markdown="1">

<div class="project-facts">
  <div class="project-fact"><span>首次提交</span><strong>2026 年 8 月 27 日</strong></div>
  <div class="project-fact"><span>项目形态</span><strong>开源贡献 + 内部增强</strong></div>
  <div class="project-fact"><span>当前版本</span><strong>v1.5.0（内部）/ PR #1（上游）</strong></div>
  <div class="project-fact"><span>出生地</span><strong>AI 漫剧轮岗</strong></div>
</div>

## 它解决什么问题

审片工具 [MiniPreview](https://github.com/kelseyyang200/minipreview)（作者阿沛，我的同事 hh）是零依赖单文件的批注利器，但**没有任何记忆**：刷新丢批注、每次要重新选文件、多项目切换全靠脑子记。AI 漫剧一天审几集，这些摩擦很伤。

## 我们做了什么（v1.0.0 → v1.5.0，五个版本一天半迭代完）

- **多根工作区**：像 VSCode 一样把几个项目目录都挂上侧边栏，丢视频进去直接点开，逐目录折叠/筛选/顺序加载
- **最近打开 + 批注缓存**：IndexedDB 持久化项目记录（含文件句柄），批注按项目自动保存，重开自动恢复
- **会话自动恢复**：刷新 / 重开浏览器直接回到上次的视频、批注、播放位置
- **超级导入导出**：批注 + 原视频打包成 ZIP 完整包（零依赖手写 store 模式 ZIP 引擎，Python zipfile 交叉验证），换设备整体迁移
- **一键转码**：H.265 黑屏视频页面直接转 H.264（本机 Python+ffmpeg 助手，NVENC 硬编 20 倍提速）
- **顺手修了上游 5 个 bug**：删除本集崩溃、右键导出失效、输入框快捷键误触等

## 开源回馈

内部用顺之后，把**剔除内部功能**（转码助手、部署相关的版本守卫）的干净版本整理成 PR 提回上游——同事的开源项目，贡献起来格外有面儿：

- PR：[kelseyyang200/minipreview#1](https://github.com/kelseyyang200/minipreview/pull/1)
- fork 分支：[lyzbcy/minipreview · feat/memory-and-workspace](https://github.com/lyzbcy/minipreview/tree/feat/memory-and-workspace)

<div class="project-outcome" markdown="1">

**当前结果**

- 内部增强版（v1.5.0 全量）：[help.wshoto.com/.../d94dca03.html](https://help.wshoto.com/resource/6fe1735d177343599a25c1f02a4c6d66/d94dca03.html)，AI 漫剧审片每天在用
- 上游 PR #1 已提交，等阿沛 review 🍵
- 配套沉淀：项目专属开发 Skill + 6 份模块文档（docs/），下一个 AI 接手零上下文成本

</div>

</div>
