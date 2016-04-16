# MRStatusBarHUD
克隆一个简单的状态栏指示器小框架

## 显示成功信息
...objc
[MRStatusBarHUD showSuccess:@"加载成功!"];
...

## 显示失败信息
...objc
[MRStatusBarHUD showError:@"加载失败!"];
...

## 显示加载信息
...objc
[MRStatusBarHUD showLoading:@"正在加载中..."];
...

## 显示普通信息
...objc
[MRStatusBarHUD showMessage:@"没有什么事!!!!" image:[UIImage imageNamed:@"check"]];
...

## 隐藏
...objc
[MRStatusBarHUD hide];
...


