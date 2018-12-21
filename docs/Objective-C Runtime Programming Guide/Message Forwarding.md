# Message Forwarding

向不处理该消息的对象发送消息是错误的。但是，在宣布错误之前，运行时系统给接收对象第二次处理消息的机会。

## Forwarding

如果您将消息发送给不处理该消息的对象，那么在宣布错误之前，运行时将向该对象发送 forwardInvocation: 消息的惟一参数是NSInvocation对象—NSInvocation对象封装了原始消息及其传递的参数。
您可以实现 forwardInvocation: 方法来为消息提供默认响应，或者以其他方式避免错误。顾名思义，forwardInvocation: 通常用于将消息转发到另一个对象。
要了解转发的范围和意图，请设想以下场景:首先，假设您正在设计一个对象，该对象可以响应名为negotiation的消息，并且希望其响应包含另一种对象的响应。通过将 negotiation 消息传递给您实现的 negotiation 方法主体中的其他对象，您可以轻松地完成此任务。

更进一步，假设您希望您的对象对 negotiation 消息的响应与在另一个类中实现的响应完全相同。实现这一点的一种方法是从另一个类继承方法。然而，以这种方式安排事情可能是不可能的。您的类和实现了negotiation的类位于继承层次结构的不同分支中，这可能是很好的原因。

即使你的类不能继承negotiation方法，你仍然可以通过实现该方法的一个版本来“借用”它，该版本的方法只是简单地将消息传递给另一个类的实例:

```
- (id)negotiate
{
    if ( [someOtherObject respondsTo:@selector(negotiate)] )
        return [someOtherObject negotiate];
    return self;
}
```

这种方法可能会有点麻烦，特别是如果您希望将对象传递给另一个对象时。您必须实现一个方法来覆盖您想从其他类中借用的每个方法。此外，如果您在编写代码时不知道要转发的完整消息集，那么就不可能处理这些情况。该集合可能依赖于运行时的事件，而且随着将来实现新的方法和类，它可能会发生变化。



## Forwarding and Multiple Inheritance



## Surrogate Objects

##  Forwarding and Inheritance