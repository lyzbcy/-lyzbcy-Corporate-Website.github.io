# 需求：首页 Banner 替换为 SCRM Skill 宣传 + 无锡办公室地址更新

- 日期：2026-09-01
- 来源：群聊记录（原始群聊记录未随归档）
- 状态：**已上线（2026-09-02 推生产，2026-09-03 确认线上稳定）**；变更文件清单见 `../reference/change-log.md`
- 设计稿：蓝湖设计稿（内网分享链接已脱敏）
- 设计切图：`切图背景.png`（背景，已归档为 `image/index-banner/20260902/banner-scrm-skill.png`）、`切掉导航.png`（成品设计图，用于比对）

## 需求 1：首页第一个 Banner 替换

官网首页第一个 banner（原「企微管家 Claw / OpenClaw 安装包」宣传位）替换为新 Banner。

### 文案（最终版，含 9/1 群内修正）

```
眉题：WorkBuddy × SCRM Skill × 企微 CLI
主标题：让 AI 直接进入企业微信做客户经营
副标题：SCRM Skill + 企微 CLI，让 WorkBuddy 连接企微客户与业务数据，从 AI 助手走向业务执行。
按钮：了解 SCRM Skill →（「解」与「SCRM」之间有一个空格）
```

右侧三个卖点（不用各自 logo，统一用指定颜色块）：

```
WorkBuddy    AI 工作入口
SCRM Skill   100+业务技能
企微 CLI     连接企业微信
```

注意：卖点半径/配色以蓝湖稿为准；「100+业务技能」是 9/1 确认后的修正文案。

### 跳转

按钮点击后**新开标签页**打开公众号文章：
公众号文章（链接已脱敏）

## 需求 2：无锡办公室地址更新

页面：关于我们 `page/about.html`（线上地址已脱敏），对应 i18n `i18n/pages/about.zh.js` / `.en.js` 的 `office4` 节点。

```
地址：（新办公地址，已脱敏）
路线：（路线说明，已脱敏）
```

（旧地址为「山水科教园3号楼10层」，同时检查地图坐标 `map_4` 的 location 是否需要同步。）

## 需求 3：中英文适配

所有新增/修改文案都要有中英两份 i18n key，缺英文需自行翻译并保持语义。

## 代码落点速查

- Banner：`index.html` 第一屏 `banner-item-open-claw`（约 542 行起），文案 key 在 `i18n/common.*.js` 的 `index.banner.slide1.*`
- 无锡地址：`page/about.html` 约 545-553 行 `office4`，key 在 `i18n/pages/about.*.js` 约 206 行

## 验收标准

1. 首页第一屏展示新 Banner，按钮新标签页打开公众号文章
2. 英文站（`?lang=en`）对应文案正确显示
3. 无锡地址/路线为新地址，页面其余内容无回归
4. 改动上线时递增 `index.html` / `about.html` 直连资源的 `?v=` 版本号
