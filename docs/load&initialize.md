# Load & Initialize



首先来说一下调用时机：

+load()方法：官方文档上说Invoked whenever a class or category is added to the Objective-C runtime;，意思是说当类被加载到runtime的时候就会运行，也就是说是在main.m之前~会根据Compile Sources中的顺序来加载，但还有一个需注意的加载顺序
A class’s +load method is called after all of its superclasses’ +load methods.

A category +load method is called after the class’s own +load method.
意思是说有继承关系的会先调用父类+load，扩展的类在所有的类在方法之后再开始扩展方法的+load，每个类只会调用一次+load
+initialize()方法：官方文档上说Initializes the class before it receives its first message.意思是在类接收第一条消息之前初始化类
值得注意的点是：类初始化的时候每个类只会调用一次+initialize()，如果子类没有实现+initialize()，那么将会调用父类的+initialize()，也就是意味着父类的+initialize()可能会被多次调用


最后说下使用场景：

+load():通常用来进行Method Swizzle，尽量避免过于复杂以及不必要的代码
+initialize():一般用于初始化全局变量或静态变量


>[简书](https://www.jianshu.com/p/ffdefa76e4a2)
