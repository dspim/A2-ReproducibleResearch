---
title: "Shiny"
output: ioslides_presentation
---

## 學習目標

(4hr)

1. 了解Shiny的整體架構和運作原理(30 min ~ 1 hr)
2. 可以寫出簡單的Shiny Application (1 ~ 2 hr)
    - 輸入Select, Checkbox, Slidebar, Text
    - 輸出Table, Figure, Tab
3. 可以透過查詢文件，自學更複雜的Shiny Application 30 min ~ 1 hr
4. **擴充Shiny Application (HTMLWidgets)** (Bonus of Reproducible Research)

## 什麼是Shiny?

## Shiny 的用途 

- Shiny是一個動態圖表製作工具
- 實際Shiny的範例

## Shiny的運作原理

- 實際Shiny的範例
- 客戶端：定義使用者看到的所有內容
    - 輸入的界面
        - 輸入的格式
        - 輸入的說明
    - 輸出的界面
        - 輸出的格式
    - 排版與美工
    
## Shiny的運作原理

- 實際Shiny的範例
- 實際Shiny的範例的（ui.R）

## Shiny的運作原理

- 實際Shiny的範例
- 實際Shiny的範例後端（server.R）
- Per-Session / All-Session (inside `shinyServer` or not)

## Shiny的運作原理

- 實際Shiny的範例
- 流程圖

ui.R --R--> HTML/CSS/Javascript ---> browser <--> R <--- server.R

## 如何開發Shiny

## Hello Shiny（我們做）

- global.R 匯入資料
- ui.R 制定輸入選項
- server.R 制定輸出選項
- 複習一次Shiny的運作流程

## 你的第一個Shiny App（學生做）

- Select + 表的輸出

## 你的第二個Shiny App（學生做）

- 第一個Shiny App沒有用到的輸入
- 圖的輸出

## 你的第三個Shiny App（學生做）

- 第二個Shiny App沒有用到的輸入
- 圖表的輸出(Tab Set)

## 你的第四個Shiny App（學生做）

- 外部資料源（SQL database）

## Advance

## Shiny的擴充


