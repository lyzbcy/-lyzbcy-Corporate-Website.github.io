# Reference：变更文件数据库（增量打包清单）

> 每次开发完成后必须更新本文件：记录新增/修改的每一个文件，增量打包给后端时按此清单逐项核对，不会遗漏。

## 使用规则

1. 新增文件 = 「新增」，改动已有文件 = 「修改」；纯注释掉历史代码也算「修改」
2. 状态：`待提测` → `测试中` → `已上线(日期)`
3. 上线涉及静态资源版本号变更时，在「备注」列写明 `?v=` 旧值 → 新值
4. 打包时：新增文件整份带入；修改文件整份替换（本站无构建合并，HTML/CSS/JS/图片均为独立文件）

## 2026-09-02 需求：首页 banner 替换 + 无锡地址更新

| # | 文件路径 | 类型 | 变更内容 | 版本号 | 状态 |
| --- | --- | --- | --- | --- | --- |
| 1 | `image/index-banner/20260902/banner-scrm-skill.png` | 新增 | 新首页 banner 背景图（源：设计切图 切图背景.png，3840x1296 PNG） | - | 已上线(2026-09-02) |
| 2 | `index.html` | 修改 | slide1 换新 banner（旧 OpenClaw 块注释保留）；眉题拆 3 段 + `.eb-x` 分隔；`css/index.css?v=→9`、`i18n/pages/index.*.js?v=1→3` | ?v 递增 | 已上线(2026-09-02) |
| 3 | `css/index.css` | 修改 | 新增 `.banner-item-scrm-skill` 背景规则（zh/en 共用图）；注释旧 `.banner-item-open-claw` 两条；新增 `.eyebrow`/`.eb-x`/`.title.title-scrm`/slide1 字体规则；`.wh8` 197px。按蓝湖标注还原后两处用户校准：①标题 42→32px 对齐其他 banner（副标题 margin 18→10 保锚点）；②按钮文字 Medium→Regular + slide1 文案区显式 PingFang 字体栈（成图比对优先于蓝湖标注） | ?v=9 | 已上线(2026-09-02) |
| 4 | `i18n/pages/index.zh.js` | 修改 | `banner.slide1` 改为 eyebrow1/2/3、title、desc、btn 六个 key（删旧 key logoSrc/logoAlt） | ?v=3 | 已上线(2026-09-02) |
| 5 | `i18n/pages/index.en.js` | 修改 | 同上，英文文案（WeShine/WeCom 命名对齐站内惯例） | ?v=3 | 已上线(2026-09-02) |
| 6 | `page/about.html` | 修改 | office4 地址/路线默认文案；无锡 tab `location="（精确坐标已脱敏）"`（用户坐标拾取器精确值）；JSON-LD `streetAddress` 同步（省市由 addressLocality/Region 字段承载，streetAddress 只留区以下）；i18n script 补 `?v=2` 击穿缓存（CR 阻断项修复） | - | 已上线(2026-09-02) |
| 7 | `i18n/pages/about.zh.js` | 修改 | `contact.office4` address/route 新文案 | - | 已上线(2026-09-02) |
| 8 | `i18n/pages/about.en.js` | 修改 | `contact.office4` address/route 英文 | - | 已上线(2026-09-02) |

### CR 记录（2026-09-02，无上下文子 Agent 审查）

- 阻断①（已修复）：about.html 两个 i18n script 无 `?v=`，补 `?v=2`
- 建议②（保持现状）：主标题「让AI」无空格以设计成图为准（蓝湖 UILabel 同款）；眉题「SCRM Skill」含空格为群聊终版文案，desc「公司SCRM Skill」无空格为设计稿原文，各自忠于来源
- 建议③（有意决策）：英文站标题 28px 由既有 `.lang-en .title !important` 规则接管，与站内英文 banner 一致
- 建议④（已修复）：本表版本号记录改为实际值（index.css ?v=9）
- 建议⑤（已修复）：JSON-LD streetAddress 去掉省市前缀，规范 schema.org 语义

### 待办/风险

- [x] 无锡地图坐标已校准：2026-09-02 用户提供精确值 `（精确坐标已脱敏）`（lbs.qq.com/getPoint 拾取），已替换并实测地图初始化正常
- [ ] 英文站 banner 背景图与中文共用（右侧卖点标签是中文烙印），后续拿到设计师的英文版切图后：图放 `image/index-banner/`，在 `css/index.css` 补 `.lang-en .slide .banner-item-scrm-skill` 规则即可

## 历史归档

（暂无，本文件自 2026-09-02 建立）
