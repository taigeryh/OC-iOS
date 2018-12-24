# Declared Properties

当编译器遇到属性声明时(请参阅Objective-C编程语言中声明的属性)，它将生成与封闭类、类别或协议相关联的描述性元数据。您可以使用支持按名称查找类或协议上的属性的函数来访问此元数据，以@encode字符串获得属性的类型，并将属性的属性列表复制为C字符串数组。声明的属性列表可用于每个类和协议。

# Property Type and Functions

Property 结构定义属性描述符的不透明句柄。

```
typedef struct objc_property *Property;
```

您可以使用class_copyPropertyList和protocol_copyPropertyList函数分别检索与类(包括已加载的类别)和协议相关的属性数组:

```
objc_property_t *class_copyPropertyList(Class cls, unsigned int *outCount)
objc_property_t *protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
```
例如，给定下面的类声明：

```
@interface Lender : NSObject {
    float alone;
}
@property float alone;
@end
```

您可以使用:

```
id LenderClass = objc_getClass("Lender");
unsigned int outCount;
objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);
```

您可以使用property_getName函数来发现属性的名称:

```
const char *property_getName(objc_property_t property)
```

您可以使用class_getProperty和protocol_getProperty函数分别在类和协议中获得对具有给定名称的属性的引用:

```
objc_property_t class_getProperty(Class cls, const char *name)
objc_property_t protocol_getProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)

```

您可以使用property_getAttributes函数来发现属性的名称和@encode类型字符串。有关编码类型字符串的详细信息，请参阅类型编码;

`const char *property_getAttributes(objc_property_t property)`

将这些放在一起，您可以使用以下代码打印与类关联的所有属性的列表:

```
id LenderClass = objc_getClass("Lender");
unsigned int outCount, i;
objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);
for (i = 0; i < outCount; i++) {
    objc_property_t property = properties[i];
    fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
}

```

# Property Type String

您可以使用property_getAttributes函数来发现属性的名称、@encode类型字符串和属性的其他属性。

字符串以T开头，后面跟着@encode类型和逗号，以V结尾，后面跟着支持实例变量的名称。在这些属性之间，属性由以下描述符指定，以逗号分隔:

# Property Attribute Description Examples

# 文档
>[Declared Properties](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101-SW24)