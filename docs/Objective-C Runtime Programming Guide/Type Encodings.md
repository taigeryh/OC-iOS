# Type Encodings

为了帮助运行时系统，编译器为字符串中的每个方法编码返回和参数类型，并将该字符串与方法选择器关联。它使用的编码方案在其他上下文中也很有用，因此可以通过@encode()编译器指令公开使用。当给定类型规范时，@encode()返回该类型的字符串编码。类型可以是一个基本类型，例如int、指针、带标记的结构或union，或者类名——实际上，任何类型都可以用作C sizeof()操作符的参数。

```
char *buf1 = @encode(int **);
char *buf2 = @encode(struct key);
char *buf3 = @encode(Rectangle);
```

下表列出了类型代码。请注意，其中许多代码与您为存档或分发目的对对象进行编码时使用的代码重叠。但是，这里列出的一些代码在编写编码器时不能使用，还有一些代码在编写不是由@encode()生成的编码器时可能需要使用。(有关存档或分发的编码对象的更多信息，请参阅Foundation Framework参考资料中的NSCoder类规范。)


# 文档

>[Type Encodings](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1)