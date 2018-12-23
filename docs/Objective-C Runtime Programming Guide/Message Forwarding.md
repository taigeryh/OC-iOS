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

forwardInvocation: 消息提供的第二个机会是为这个问题提供了一个不那么特别的解决方案，而且是动态的，而不是静态的。它的工作原理是这样的:当一个对象由于消息中没有匹配选择器的方法而无法响应消息时，运行时系统通过发送forwardInvocation:消息通知对象。每个对象都继承NSObject类中的forwardInvocation:方法。然而，NSObject的方法版本只是调用了doesNotRecognizeSelector:。通过覆盖NSObject的版本并实现您自己的版本，您可以利用forwardInvocation:消息提供的将消息转发到其他对象的机会。

要转发消息， forwardInvocation:消息需要做的就是:
1. 确定消息应该发送到哪里，以及
2. 将它与原始参数一起发送到那里。

可以使用invokeWithTarget: 方法发送消息:

```
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([someOtherObject respondsToSelector:
            [anInvocation selector]])
        [anInvocation invokeWithTarget:someOtherObject];
    else
        [super forwardInvocation:anInvocation];
}
```

被转发的消息的返回值返回给原始发送方。所有类型的返回值都可以传递给发送方，包括id、结构和双精度浮点数。

forwardInvocation:方法可以充当未识别消息的分发中心，将它们打包到不同的接收者。或者它可以是一个转运站，将所有消息发送到相同的目的地。它可以将一条消息转换为另一条消息，或者简单地“吞下”一些消息，这样就没有响应和错误。forwardInvocation:方法还可以将多个消息合并到一个响应中。forwardInvocation:由实现者决定。然而，它为在转发链中链接对象提供的机会为程序设计打开了可能性.

forwardInvocation:只有当消息不调用名义接收方中的现有方法时，方法才能处理消息。例如，如果您希望您的对象将 negotiate 消息转发给另一个对象，它就不能有自己的negotiate 方法。如果有，消息将永远不会到达 forwardInvocation:。

有关转发和调用的更多信息，请参阅基础框架参考中的 NSInvocation 类规范。


## Forwarding and Multiple Inheritance 转发和多重继承

转发模仿继承，并且可以用于将多继承的一些效果借给Objective-C程序。通过转发消息来响应消息的对象似乎借用或“继承”了在另一个类中定义的方法实现.

如图 5-1 , 在本例中，战士类的一个实例将协商消息转发给外交官类的一个实例。这位战士看起来会像外交官一样谈判。它似乎会对谈判信息做出回应，而且出于所有实际目的，它确实会做出回应(尽管实际上是一位外交官在做这项工作)。

因此，转发消息的对象从继承层次结构的两个分支(它自己的分支和响应消息的对象的分支)“继承”方法。在上面的例子中，战士类似乎继承自外交官类和它自己的超类。

转发提供了您通常希望从多个继承获得的大部分特性。然而，两者之间有一个重要的区别:多个继承将不同的功能组合在一个对象中。它倾向于大型、多面的物体。另一方面，转发将不同的职责分配给不同的对象。它将问题分解成更小的对象，但是以对消息发送者透明的方式将这些对象关联起来。

## Surrogate Objects  代理对象

转发不仅模仿了多重继承，还使开发表示或“覆盖”更实际对象的轻量级对象成为可能。代理程序代表另一个对象，并将消息传递给它。

Objective-C编程语言中“远程消息传递”中讨论的代理就是这样的代理。代理负责将消息转发到远程接收者的管理细节，确保跨连接复制和检索参数值，等等。但它不打算做太多其他事情;它不复制远程对象的功能，而只是给远程对象一个本地地址，一个它可以在另一个应用程序中接收消息的地方。

其他类型的代理对象也是可能的。例如，假设您有一个处理大量数据的对象——也许它创建了一个复杂的图像或读取磁盘上文件的内容。设置这个对象可能很耗时，所以您更喜欢在真正需要它或系统资源暂时空闲时惰性地完成它。同时，您至少需要这个对象的占位符，以便应用程序中的其他对象能够正常工作。

在这种情况下，您最初可以创建它的轻量级代理，而不是完全成熟的对象。这个对象可以自己做一些事情，例如回答关于数据的问题，但是大多数情况下，它只会为较大的对象保留一个位置，并在时机成熟时将消息转发给它。当代理的 forwardInvocation:方法首先接收到一条发送给另一个对象的消息时，它将确保该对象存在，并在不存在的情况下创建该对象。较大对象的所有消息都经过代理程序，因此，就程序的其余部分而言，代理程序和较大对象是相同的。

##  Forwarding and Inheritance

尽管转发模拟继承，NSObject类从不混淆这两者。像respondsToSelector:和isKindOfClass:只看继承层次结构，而不看转发链。例如，如果一个战士被问及他是否对谈判信息做出回应，

```
if ( [aWarrior respondsToSelector:@selector(negotiate)] )
    ...
```

答案是 NO 的，尽管它可以毫无差错地接收谈判信息并作出回应，从某种意义上说，就是把这些信息转发给外交官。

在很多情况下，NO 是正确的答案。但事实可能并非如此。如果您使用转发来设置代理对象或扩展类的功能，转发机制可能应该与继承一样透明。如果您希望您的对象的行为就像它们确实继承了它们转发消息到的对象的行为一样，那么您需要重新实现respondsToSelector:和isKindOfClass: 方法来包含您的转发算法:

```
- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ( [super respondsToSelector:aSelector] )
        return YES;
    else {
        /* Here, test whether the aSelector message can     *
         * be forwarded to another object and whether that  *
         * object can respond to it. Return YES if it can.  */
    }
    return NO;
}
```

除了respondsToSelector:和isKindOfClass:， instancesRespondToSelector:方法还应该镜像转发算法。如果使用协议，那么conformsToProtocol:方法也应该添加到列表中。类似地，如果一个对象转发它接收到的任何远程消息，它应该具有methodSignatureForSelector的一个版本:该版本可以返回对最终响应转发消息的方法的精确描述;例如，如果一个对象能够将消息转发给它的代理，那么您将实现methodSignatureForSelector:

```
- (NSMethodSignature*)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature* signature = [super methodSignatureForSelector:selector];
    if (!signature) {
       signature = [surrogate methodSignatureForSelector:selector];
    }
    return signature;
}
```

您可以考虑将转发算法放在私有代码中的某个位置，并拥有所有这些方法，forwardInvocation: include，调用它。

注意:这是一种高级技术，只适用于没有其他解决方案的情况。它不打算作为继承的替代品。如果必须使用此技术，请确保完全理解执行转发的类和要转发的类的行为。

本节中提到的方法在Foundation framework引用中的NSObject类规范中进行了描述。有关invokeWithTarget:的信息，请参阅基础框架参考中的 NSInvocation 类规范。