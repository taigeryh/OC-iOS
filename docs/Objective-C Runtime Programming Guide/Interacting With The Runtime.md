# 与 Runtime 交互

Objective-C 程序跟 runtime 系统交互有三种截然不同的方式。

1. Objective-C 源码
2. NSObject 类中定义的方法
3. 直接调用 runtime 方法


# Objective-C Source Code

对于大多数情况， runtime 系统在后台自动运行。 你只需要编写，编译 Objective-C 源码就可以使用 runtime。
当你编译含有 OC 类和方法的代码时，编译器创建实现语言动态特性的数据结构和函数调用。
数据结构捕捉类和类别定义以及协议声明中的信息。他们包括类和协议对象，也有方法选择器(selectors), 实例变量模板，和源码中获取的其他信息。
主运行时函数是发送消息的函数。它由源代码消息表达式调用。

# NSObject Methods

Cocoa中的大多数对象都是NSObject类的子类，所以大多数对象继承了它定义的方法。(值得注意的例外是NSProxy类, 消息转发)。
因此，它的方法建立了每个实例和每个类对象固有的行为。然而，在一些情况下，NSObject类仅仅定义了一个模板，用于说明应该如何完成某件事情;它本身并没有提供所有必需的代码。
例如，NSObject类定义了一个描述实例方法，该方法返回一个描述类内容的字符串。这主要用于调试—GDB print-object命令打印从该方法返回的字符串。这个方法的NSObject实现不知道类包含什么，所以它返回一个带有对象名称和地址的字符串。NSObject的子类可以实现这个方法来返回更多的细节。例如，Foundation类NSArray返回它包含的对象的描述列表。
一些NSObject方法只是在运行时系统中查询信息。这些方法允许对象执行自省。此类方法的示例是类方法，它要求对象标识其类;isKindOfClass:和isMemberOfClass:，用于测试对象在继承层次结构中的位置;respondsToSelector:，表示对象是否可以接受特定的消息;conformsToProtocol:，表示对象是否声明要实现在特定协议中定义的方法;和methodForSelector:，它提供了方法实现的地址。这样的方法使一个对象能够自省。

# Runtime Functions

运行时系统是一个动态共享库，其公共接口由位于/usr/include/ object .目录中的头文件中的一组函数和数据结构组成其中许多函数允许您使用纯C来复制编写Objective-C代码时编译器所做的事情。其他则构成通过NSObject类的方法导出的功能的基础。这些功能使开发运行时系统的其他接口和生成扩展开发环境的工具成为可能;在Objective-C中编程时不需要它们。然而，在编写Objective-C程序时，一些运行时函数有时可能是有用的。所有这些函数都记录在[Objective-C Runtime Reference](https://developer.apple.com/documentation/objectivec/objective-c_runtime)中。


# 链接

>[Objective-C Runtime Reference](https://developer.apple.com/documentation/objectivec/objective-c_runtime)
