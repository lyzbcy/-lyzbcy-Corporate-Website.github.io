# Reference：首页 Banner 轮播

## SCRM Skill banner 设计规格（蓝湖标注，2026-09-02 已按此还原）

| 元素 | 规格 |
| --- | --- |
| 眉题 | 18px PingFangSC-Semibold(600)，#0067FF，行高28px；分隔符「×」为浅蓝 rgba(0,103,255,.32)，左右间距 8px；行容器高 40px |
| 主标题 | **32px（用户决策：对齐站内其他 banner；蓝湖原标注 42px 偏大）**，600 字重，#222222，行高 67px（`.title` 默认），距眉题 14px；副标题上边距相应改 10px 保持原锚点 |
| 副标题 | 24px PingFangSC-Regular，#555555，行高 33px，宽 628px（两行，第一行断在「企微客户」后），距标题 10px |
| 按钮 | 197×48，圆角 24，渐变 270deg #165BFE→#2E7AFF（即 `.homePageBtm` 原样式），文字 18px **Regular(400)**（设计成图为常规粗细，蓝湖标注 Medium 与成图不符，以成图为准），距副标题 24px |
| 字体 | slide1 文案区（眉题/标题/副标题/按钮）显式指定 `"PingFang SC", "Hiragino Sans GB", "Microsoft YaHei"`，避免拉丁字符走站内默认的 Helvetica Neue 导致观感偏粗偏紧 |
| 文案区左缘 | x=360（容器 `.carousel-caption` 的 `top:192px` 起） |

实测还原精度：各文本块与设计稿误差 ≤1px（逐行像素比对）。标题字号后经用户决策改为 32px 对齐其他 banner（副标题/按钮锚点 328/413 保持不变）。改动字号时注意 `.title-scrm` 必须用 `.title.title-scrm` 双类选择器压过默认 `.title`（48px）。

## 结构

首页轮播是 Bootstrap carousel（`#carousel-ad` / `#banner-box`），每个 slide 是 `.item.banner-item`，第一个 slide 带 `.active`。轮播指示器 `<ol>` 里的 `<li data-slide-to>` 数量要与 slide 数一致。

## 现有 slide（index.html 约 540-600 行）

1. slide1：`banner-item-open-claw` —— OpenClaw 宣传（**本次要被替换的位置**）
   - 结构：logo 图 + `.title` + `.desc` + `.watch_btn` 按钮
   - i18n key：`index.banner.slide1.title/desc/logoSrc/logoAlt`、`index.banner.learnMore`（按钮文案，多 slide 共用，改它会影响其他 slide，新按钮文案建议用独立 key）
2. slide2：AI 大模型能力宣传（背景图 `image/index-banner/20250825/ds.png`）
3. slide3：红杉腾讯投资
4. slide4：100 家 500 强

## 改动套路

1. 设计稿切图放入 `image/index-banner/<yyyymmdd>/`（按日期归档是既有惯例）
2. 替换 slide1 内部 DOM：眉题 / 主标题 / 副标题 / 按钮 / 右侧三个卖点
3. 文案一律走 i18n：HTML 写默认中文 + `data-i18n` key，`i18n/common.zh.js` 与 `common.en.js` 同步补 key
4. 按钮链接：`<a href="公众号文章（链接已脱敏）" target="_blank">`
5. 被替换的旧 slide 可参考文件里已有注释块的写法整段注释保留，不要直接删除历史
6. 验证：`npm run preview:local`，切 `?lang=zh` / `?lang=en` 各看一遍，点按钮确认新标签页打开
