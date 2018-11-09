# MySwiftStudyProject

这是我记录的一些学习Swift时，照着做的一些简易app样例。学习的课程来自 Stanford 公开课 CS193p Taught by Paul Hegarty

版本： ` Swift 4 ` , ` Xcode 10 `

使用apps中的文件时，记得看` Main.storyboard `中的` ViewController `调用的是哪个class，并不是自带的` ViewController.swift ` 

---

## 样例
### 简易计算器(Calculator)
+ features

	整数带加减法，开方和三角函数cos计算，你可在此基础上增加

	将开方运算更改为闭包方式  -- 29/10/2018

### UI画笑脸  (Faceit)
+ features

	使用线条画出的笑脸。

	支持缩放，变换表情，睁/闭眼，改变颜色  --27/10/2018

	含有 Multiple MVCs，支持点击变换表情  --28/10/2018

### 实时获取图片 (Cassini)
+ features

	支持scrollview的zoom --29/10/2018

	支持通过scroll 进行移动图片 --30/10/2018

	支持MultiThreading,点击图片不会因为下载图片而造成在Queue中等待(已将图片换为我站demo，因为课程中的图片下载太慢) --1/11/2018
	
### Twitter Client Demo (Smashtag)
+ Notes

      1. 因为CS193p课程中无Twitter部分的代码，该demo无法完整完成。我clone了GitHub上的 mahkeeoh/Smashtag/ 的Twitter部分代码。但可能因为其代码的版本稍低而在你的Xcode上无法正常运行
      2. workspace文件包含了Smashtag和Twitter的framework，启动它就可以打开该appDemo
      3. 你使用该Twitter文件的时候有可能已经失去了Grant，因此无法进行登录读取等操作

+ features

	完成UI界面（Table View -> Subtitle） --8/11/2018

        
        
    
...

持续更新
---


