Xcode 配置文件
====

配置目录
----
* UserData [~/Library/Developer/Xcode/UserData](file://localhost/Users/BB9z/Library/Developer/Xcode/UserData)

  代码片段、配色、代码片段及其他用户数据

* Templates [~/Library/Developer/Xcode/Templates](file://localhost/Users/BB9z/Library/Developer/Xcode/Templates)
 
  用户模版
  
* IDETextKeyBindingSet [Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/](file:///Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/)

  IDETextKeyBindingSet.plist 所在目录，该文件用于定义 Xcode 首选项中的 Key Bindings 列表。另见： http://stackoverflow.com/q/10266170/
  
  
安装
----
执行目录 install.command 以安装，Xcode 更新后需要重新安装键绑定（使用 reinstall-keybing.command 就行）。

Xcode 需要安装在 /Applications 目录下。不保证正确性，Use on your own risk.