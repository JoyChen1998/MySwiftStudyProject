# MySwiftStudyProject

这是我记录的一些学习Swift时，照着课程所做的一些简易app样例。

代码版本： ` Swift 4 ` , ` Xcode 10 `


---

## 学习的课程
 
 + Stanford 公开课 CS193p Taught by Paul Hegarty
 
 ...


---

## 样例
### 翻牌游戏(类似连连看)(Concentration)
+ features

	入门级appDemo
	
	翻牌就记分，点击变换图像
	
	实现类似连连看功能，配对相同则两张牌消失 (but do not give the cards a shuffle)
	
	fix bug on 11/20/2018
	
### 简易计算器(Calculator)
+ features

	整数带加减法，开方和三角函数cos计算，你可在此基础上增加

	将开方运算更改为闭包方式  -- 10/29/2018

### UI画笑脸  (Faceit)
+ features

	使用线条画出的笑脸。

	支持缩放，变换表情，睁/闭眼，改变颜色  --10/27/2018

	含有 Multiple MVCs，支持点击变换表情  --10/28/2018

### 实时获取图片 (Cassini)
+ features

	包含scrollview的zoom --10/29/2018

	包含通过scroll 进行移动图片 --10/30/2018

	包含`MultiThreading`,点击图片不会因为下载图片而造成在Queue中等待(已将图片换为我站demo，因为课程中的图片下载太慢) --11/1/2018
	
### Twitter Client Demo (Smashtag)
+ Notes

      1. This demo cannot be completed because the Twitter framework code is not displayed on the CS193p. After that, I cloned Twitter's framework's Code on GitHub.com/mahkeeoh/Smashtag/ (Swift 3 version). 
      2. The workspace include Smashtag & Twitter's framework，launch it can open this appDemo
      *3. iOS 11(or later) no longer supports using Twitter through the built-in social framework.

+ features

	完成UI界面（Table View -> Subtitle） --11/8/2018
	
	完成搜索功能(但因为无法获取grant，因此无法实现) --11/11/2018
	
	完成界面（Table View Change to -> Custom & And Image, Text ） --11/11/2018
	
	添加Core Data，from github --11/12/2018
	
...

持续更新
---


