# JinnScreenOrientationExample
iOS6 及其以上版本自动旋转、手动强制旋转各种场景方案。

相关的具体介绍的文章是：http://blog.csdn.net/jinnchang/article/details/46974255
# Notice
推荐使用最新版本的 Xcode 进行编译运行。
# Examples
#####AnyOrientationRotationExample

- 整体应用任意旋转场景（一般 iPad 应用都是这种方式）

#####ForceOrientationRotationExample

- 整体应用限制旋转，个别页面支持手动强制旋转（如部分本地视频播放器）

#####IndividualRotationExample 

- 整体应用限制旋转，个别页面支持自动旋转（如：文档类应用，整体不支持旋转，阅读页面支持任意旋转）

#####LocalForceRotationExample 

- 整体应用限制旋转，个别页面局部支持旋转全屏（如：优酷的播放画面）

#####SingleOrientationExample 

- 整体应用限制单个方向（一般 iPhone 应用都是这种方式）

# Github
https://github.com/jinnchang