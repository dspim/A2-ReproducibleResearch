
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(data.table)
library(shiny)
library(ggplot2)
library(dplyr)
library(magrittr)
library(reshape2)
# gridExtra是用來讓同一視窗呈現多圖的package，請自行安裝
library(gridExtra)

# 讀檔
H1=fread('hypermall_H1.csv')
S1=fread('hypermall_S1.csv') 
T1=fread('hypermall_T1.csv')

# 將三家店的資料合併
demo_data=rbind(H1,S1,T1)

toiletries=demo_data %>%
# 原本的日期是字串，改成"Date"類別，%m代表月，%d代表日，%Y代表年（大寫才會完整表示西元年）
  mutate(Date=as.Date(Date,"%m/%d/%Y")) %>%
# 選出跟個人清潔用品相關的部門
  filter(Dept=="gva-fjLO") %>%
# 只選擇Date,Store,Sales_Value等欄位
  select(Date,Store,Sales_Value) %>%
# 按照日期和店家將資料群聚，並且算出每家店每天在個人清潔用品的銷售總額
  group_by(Date,Store) %>%
  summarise(income=sum(Sales_Value)) %>%
# 到了上述的步驟，會得到三個欄位，分別是Date、Store和income，
# 為了選取資料方便，我們可以用dcast將資料欄位變成Date、H1、S1、T1，
# H1、S1和T1裡的資料分別是此三家店每天的個人清潔用品的銷售總額
# 有可能會有缺資料的情況，可以用fill=0，將沒資料的日子補零
  dcast(Date~Store,value.var = "income",fill=0) 

# 以下則是取一般環境清潔用品的資料
cleaners=demo_data %>%
  mutate(Date=as.Date(Date,"%m/%d/%Y")) %>%
  filter(Dept=="gva-Vimz") %>%
  select(Date,Store,Sales_Value) %>%
  group_by(Date,Store) %>%
  summarise(income=sum(Sales_Value)) %>%
  dcast(Date~Store,value.var = "income",fill=0) 

shinyServer(function(input, output) {

# 以下是為了畫出各店家某兩部門每天的銷售額，畫完後會隨著"distPlot"，
# 回傳到UI（user interface），在網頁上呈現
  output$distPlot <- renderPlot({

# 由UI（user interface）回傳check box的值，用來控制顯示店家
    store=input$store
    
# 由UI（user interface）回傳slider bar的數值，用來控制顯示日期
    bins <- input$bins[1]:input$bins[2]
    
# 只取選擇的日期範圍與店家的資料，而且為了方便在畫圖時顯示不同店家
# 用melt將資料還原成欄位為Date、Store和toi，toi的欄位為每天的個人清潔用品的銷售總額
    toiletries=toiletries[bins,c("Date",input$store)] %>%
      melt(id="Date",variable.name="Store",value.name = "toi")
    
    cleaners=cleaners[bins,c("Date",input$store)] %>%
      melt(id="Date",variable.name="Store",value.name = "cle")

# 開始畫圖，先把圖形資料先以toi和cle存起來
    toi=ggplot(toiletries,aes(x=Date,y=toi))+
      geom_line(aes(color=Store))+
      ylab('toiletries')+
      theme(text=element_text(size=20))
    
    cle=ggplot(cleaners,aes(x=Date,y=cle))+
      geom_line(aes(color=Store))+
      ylab('cleaners')+
      theme(text=element_text(size=20))

# 然後，用grid.arrange將兩張圖放在一起。nrow=2，代表圖形會上下擺放兩張圖
    p=grid.arrange(toi, cle, nrow=2)

# 最後，用print才能讓ggplot2的圖在shiny呈現
    print(p)

  })

# 以下是為了畫出toi和cle之間的關係，隨著"model"回傳到UI
    output$model <- renderPlot({
      
      store=input$store
           
      toiletries=toiletries[,c("Date",input$store)] %>%
        melt(id="Date",variable.name="Store",value.name = "toi")
      
      cleaners=cleaners[,c("Date",input$store)] %>%
        melt(id="Date",variable.name="Store",value.name = "cle")
      
      sel_data=inner_join(toiletries,cleaners,by=c("Date","Store"))

# linear model
      r2=summary(lm(cle~toi,sel_data))
      
      
      p=ggplot(sel_data,aes(x=toi,y=cle))+
        geom_point()+
# geom_smooth用來畫趨勢線
        geom_smooth(method="lm")+
#標出趨勢線的方程式
        annotate("text", x=5e5, y=5e5, 
                 label=paste('y==', r2$coefficients[1],'+', r2$coefficients[2],'*x',sep=''), 
                 parse=TRUE)+
#標出R-squared  
        annotate("text", x=5e5, y=4.5e5, 
                 label=paste('R^2==', r2$r.squared,sep=''), 
                 parse=TRUE)+
        xlab('toiletries')+
        ylab('cleaners')+
        theme(text=element_text(size=20))

      
      print(p)
      
    })

})
