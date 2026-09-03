---
title: 官网企微AI宣传Banner更新
subtitle: 首页运营位换新与双语、地址信息联动更新
image: assets/img/作品集/官网企微AI宣传Banner更新/脱敏项目概览.svg
alt: 官网企微AI宣传Banner更新脱敏概览图
category: work
tags: [打工项目, 网站开发, 国际化]
featured: false
caption:
  title: 官网企微AI宣传Banner更新
  subtitle: Homepage Banner Refresh
  thumbnail: assets/img/作品集/官网企微AI宣传Banner更新/脱敏项目概览.svg
total_score: 62.3
score_value: 60
score_difficulty: 35
score_completeness: 95
score_innovation: 30
score_maintainability: 82
is_signature: ''
score_review: "首页运营位替换、地址与地图信息联动更新均完成交付并当日上线，中英双语与缓存版本处理完整，靠变更清单和 DoD 把小需求做得很稳；但需求体量小、技术方案常规，创新空间有限。"
score_model: "GLM-5.3"
---

<div class="q-bounce-content" markdown="1">

> 公开说明：公司名、站点地址、仓库与内部链接均已泛化。

<div class="project-facts">
  <div class="project-fact"><span>周期</span><strong>2026.09<br>一日开发上线</strong></div>
  <div class="project-fact"><span>职责</span><strong>前端独立开发<br>CR 与发包提测</strong></div>
  <div class="project-fact"><span>覆盖</span><strong>首页运营位<br>关于页地址信息</strong></div>
  <div class="project-fact"><span>状态</span><strong>已上线生产<br>次日确认稳定</strong></div>
</div>

## 1. 项目背景

公司要在官网首页第一屏推广新的 AI 产品组合——AI 工作台 × 业务技能包 × 企微连接器，把原来旧的安装包宣传位换掉，按钮点击后新标签页打开公众号文章；同一天还要求更新关于页的办公室地址、乘车路线和地图标点。需求在群里对齐完文案和卖点当天傍晚才到我手上，要求第二天上线。

官网是纯静态多页站（HTML + CSS + jQuery + 运行时 i18n，无构建编译），这类站改起来不难，真正容易出事的是"漏"：中英文两份语言包只改一边、结构化数据和地图坐标没跟上、静态资源版本号没递增导致线上命中旧缓存。

## 2. 我的职责

- 按设计稿还原新 banner：切图归档、排版规则、文案全部走 i18n key，中英文双语适配。
- 同步更新关于页地址：可见文案、JSON-LD 结构化数据、地图组件坐标三处联动。
- 建变更文件数据库和 DoD 清单，发包提测时照单核对，不靠记忆防遗漏。
- 无上下文子 Agent 做 CR，阻断项修复后发包测试环境、验收、当晚推生产。

## 3. 实现方案

<ol class="project-flow">
  <li><strong>整图换背景 + 文案走 i18n</strong><br>背景图按日期归档整张替换，左侧文案拆成 6 个 i18n key，中英两个语言包同步新增。</li>
  <li><strong>三处地址联动</strong><br>页面默认文案、JSON-LD、地图坐标一次改齐，坐标用官方拾取器取精确值。</li>
  <li><strong>版本号递增 + 变更清单</strong><br>所有涉及的直连资源递增 <code>?v=</code>，8 个文件逐一登记进变更数据库，打包照单执行。</li>
</ol>

## 4. 技术实现

新 banner 的排版（眉题 / 主标题 / 副标题 / 按钮字号字重间距）先按设计标注逐行还原到误差 1px 以内，再与设计成图目视比对校准。文案区显式声明中文字体栈，避免拉丁字符走站内默认字体导致观感偏粗。英文站标题字号由站内既有的英文规则接管，与其它 banner 的英文表现保持一致。旧宣传位的 DOM 整段注释保留，不删历史。

## 5. 关键难点

### 设计标注和设计成图打架，听谁的

按标注还原到像素级之后，和成图目视对比仍有观感差异：标注里主标题 42px、按钮 Medium 字重，成图实际更收敛。横向对比站内其它 banner 后判断：标注是工具导出的测量值，成图才是设计师最终认可的效果，且 42px 会破坏整站 banner 的节奏。最终标题改 32px 对齐其它 banner、按钮改常规字重，本地预览比对确认协调。经验就一句话：设计还原以成图为最终权威，标注只做初始定位。

### 静态站的缓存击穿靠 CR 兜住

CR 抓出关于页两个 i18n 脚本引用没带版本号——这种站在测试环境部署后，命中旧缓存的用户会继续看到旧地址。补上 <code>?v=2</code> 后，把"所有涉及的直连资源都递增版本号"写进这个项目 skill 的 DoD，以后照单核对而不是靠记性。

### 换地址不只是换文案

可见文案改了，JSON-LD 里还混着省市前缀（schema.org 语义里省市该由专门的字段承载），地图组件的坐标还指着旧位置。三处是三套独立数据，必须人工对齐；坐标用官方拾取器取精确值替换后实测初始化正常。

<div class="project-outcome" markdown="1">

**交付结果**

- 8 个文件变更，CR 两项阻断修复、三项建议各有决策记录，当天下午发包测试环境、验收通过、当晚推生产，次日线上确认稳定。
- 中英文双语各验证一遍，按钮跳转、地图初始化实测正常。
- 沉淀了一套官网开发 skill（渐进式披露文档 + 变更文件数据库 + DoD），后续官网需求直接复用。

</div>

## 6. 项目复盘

小需求最怕的不是做不出来，是漏。这次把"上线前要核对什么"固化成文档清单——变更文件数据库、版本号递增、双语同步、结构化数据——之后打包提测变成照单执行。另一个收获是给这类改动加了无上下文子 Agent CR：它没有先入之见，两个阻断项都是它抓出来的，对单日交付的小需求性价比很高。

</div>
