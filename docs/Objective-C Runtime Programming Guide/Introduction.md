# Introduction

重要：文档不再更新，想要 Apple SDKs 的最新信息，请访问[文档网站](https://developer.apple.com/documentation)。

Objective-C 语言可以将很多决定做了延后处理，因为这些决定可以在 compile time, link time, runtime 中作出。 无论何时，只要有可能， OC 自动处理事务。这表明 OC 不仅需要编译器，还需要 runtime 系统 来执行编译过的代码。 runtime 作为 OC 的一种 操作系统。他使得 OC 正常工作。这个文档查看 NSObject 类， OC如何同 runtime 系统交互。 特别是，它在 runtime 检查 自动加载新类的 范式。将消息转发给其他类。 它也能在程序运行时，找到对象相关信息。

你可以阅读这个文档来理解 OC runtime 系统如何工作，并对之加以利用。虽然编写 Cocoa 应用，并没有必要知道和理解这个文档。

1. compile time
2. link time 
3. runtime

# 文档组织

这个文档含有以下章节：

- Runtime 版本和平台
- Runtime 的交互
- 消息发送
- 动态方法解析
- 消息转发
- 类型编码
- 声明属性

# 另请参阅

>[Objective-C Runtime Reference ](https://developer.apple.com/documentation/objectivec/objective-c_runtime)

>[Programming with Objective-C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210)

>[Objective-C Release Notes ](https://developer.apple.com/library/archive/releasenotes/Cocoa/RN-ObjectiveC/index.html#//apple_ref/doc/uid/TP40004309)

# 链接

>[Introduction](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008048-CH1-SW1)

>[一个博客](https://www.cnblogs.com/ioshe/p/5489086.html)

