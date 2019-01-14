# MySwiftStudyProject

这是我记录的一些学习Swift时，按照所讲课程做的一些简易app样例。

代码版本： *` Swift 4 `* , *` Xcode 10 `*


---

## 学习的课程
 
 + Stanford CS193p Taught by Paul Hegarty
 
 ...


---

## 样例
### 翻牌游戏(类似连连看)(Concentration)
+ features
	
    Halloween Style UI 
	
    翻牌就记分，点击变换图像
	
    实现类似连连看功能，配对相同则两张牌消失
	
    增加了StackView --2018-11-21
	
    fix bug on 2018-11-20
	
### 简易计算器(Calculator)
+ features

    整数加减乘除法，开方和三角函数cos计算 

    将开方运算更改为闭包方式  -- 2018-10-29

### UI画笑脸  (Faceit)
+ features

    使用线条画出的笑脸。

    支持缩放，变换表情，睁/闭眼，改变颜色  --2018-10-27

    含有 Multiple MVCs，支持点击变换表情  --2018-10-28

### 实时获取图片 (Cassini)
+ features

    包含scrollview的缩放 --2018-10-29

    包含通过`scroll`进行移动图片 --2018-10-30

    包含`MultiThreading`,点击图片不会因为下载图片而造成在Queue中等待(此处为`DispatchQueue`,已将图片换为我站demo，因为课程中的图片下载太慢) --2018-11-1
	
### Twitter Client Demo (Smashtag)
+ Notes

      1. This demo cannot be completed because the Twitter framework code is not displayed on the CS193p. After that, I cloned Twitter framework's Code on GitHub.com/mahkeeoh/Smashtag/ (Swift 3 version). 
      2. The workspace include Smashtag & Twitter's framework，launch it can open this appDemo
      *3. iOS 11(or later) no longer supports using Twitter through the built-in social framework.

+ features
	
    完成搜索功能(但因为无法获取grant，因此无法实现) --2018-11-11
	
    完成界面（Table View 「 Custom & And Image, Text 」 ） --2018-11-11
	
    Add `Core Data` , the other files are from github --2018-11-12
	
    

### Drop & Drag (EmojiArt)
+ features

    可以将图片拖拽至`DropZone`了  --2018-11-27
    
    可以将collection View上的emojis进行拖拽和放置进去 --2018-11-28
    
    ~~Master View分屏显示 ,~~增删条目（在iPad Simulator上横屏能完全显示（maybe 12.9"）） --2018-11-29
    
    可以从顶部的CollectionView中拖emoji表情至下方的`DropZone`,也可以将别的图片拖至`DropZone`,按住option 调整其大小  --2018-12-1
    
    View更新至UIDocumentBrowserViewController(old ver does not have it & all_finished ver has) --2018-12-24
    
    可以将背景图片和emojis合成的图片save，然后可以将其生成一个新图片,并可以保存为一个json文件  --2018-12-24
    
    支持iPhone打开和修改该图片(iCloud Kit) --2018-12-24
    
    fix bugs -- 2018-12-2
    
    add Alert & Notifications --2018-12-26
    
    add more Segues & finished this demo -- 2019-1-14

...

持续更新
---

对此存在疑惑或者代码出现了问题？欢迎大佬提出issues指正。
