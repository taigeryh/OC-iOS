# Dynamic Method Resolution
动态方法解析

本章描述如何动态地提供方法的实现。

## Dynamic Method Resolution

在某些情况下，您可能希望动态地提供方法的实现。
例如，Objective-C声明的属性特性(请参阅[Objective-C编程语言中声明的属性](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocProperties.html#//apple_ref/doc/uid/TP30001163-CH17))包含@dynamic指令:

`@dynamic propertyName`

它告诉编译器与属性关联的方法将被动态提供。

您可以实现resolveInstanceMethod:和resolveClassMethod:来分别为实例和类方法的给定选择器动态提供实现。

Objective-C方法是一个至少包含两个参数的C函数——self和_cmd。可以使用函数class_addMethod将函数作为方法添加到类中。因此，给定以下函数:

```
void dynamicMethodIMP(id self, SEL _cmd) {
    // implementation ....
}
```

您可以使用resolveInstanceMethod(如下所示)将其作为方法动态添加到类中(称为resolveThisMethodDynamically):

```
@implementation MyClass
+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(resolveThisMethodDynamically)) {
          class_addMethod([self class], aSEL, (IMP) dynamicMethodIMP, "v@:");
          return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}
@end
```

转发方法(如消息转发中所述)和动态方法解析在很大程度上是正交的。类有机会在使用转发机制之前动态解析方法。如果调用respondsToSelector:或instancesRespondToSelector:，则动态方法解析器将有机会首先为选择器提供一个IMP。如果您实现了resolveInstanceMethod:但是希望通过转发机制实际转发特定的选择器，那么您将为这些选择器返回NO。


## Dynamic Loading

Objective-C程序可以在运行时加载和链接新的类和类别。新代码被合并到程序中，并与开始时加载的类和类别进行相同的处理.
动态加载可以用来做很多不同的事情。例如，System Preferences应用程序中的各个模块都是动态加载的.
在Cocoa环境中，动态加载通常用于定制应用程序。其他人可以编写程序在运行时加载的模块，就像Interface Builder加载自定义调色板和OS X系统首选项应用程序加载自定义首选项模块一样。可加载模块扩展了应用程序的功能。他们以一种你允许但不可能预料到或定义你自己的方式对它作出贡献。您提供框架，其他人提供代码。

虽然在Mach-O文件中有一个动态加载Objective-C模块的运行时函数(objc_loadModules，在objc/ object- load.h中定义)，Cocoa的NSBundle类为动态加载提供了一个非常方便的接口——一个面向对象并与相关服务集成的接口。有关NSBundle类及其使用的信息，请参阅基础框架参考中的NSBundle类规范。有关Mach-O文件的信息，请参阅OS X ABI Mach-O文件格式参考.


# 链接

>[属性声明](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocProperties.html#//apple_ref/doc/uid/TP30001163-CH17)