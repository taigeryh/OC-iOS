# 导入

```
#import <objc/runtime.h>
```

# runtime 优缺点

## 优点
其他方式做不到，能为应用和框架提供强大的功能。

## 缺点
混乱的运行时代码会改变运行在其架构之上的所有代码。
一切代码和逻辑都可能被异常糟糕的副作用影响。

# 定义

允许开发者对已经存在的类在扩展（category）中添加自定义的属性。

```
/* Associative References */

/**
 * Policies related to associative references.
 * These are options to objc_setAssociatedObject()
 */
typedef OBJC_ENUM(uintptr_t, objc_AssociationPolicy) {
    OBJC_ASSOCIATION_ASSIGN = 0,           /**< Specifies a weak reference to the associated object. */
    OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object. 
                                            *   The association is not made atomically. */
    OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   /**< Specifies that the associated object is copied. 
                                            *   The association is not made atomically. */
    OBJC_ASSOCIATION_RETAIN = 01401,       /**< Specifies a strong reference to the associated object.
                                            *   The association is made atomically. */
    OBJC_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
                                            *   The association is made atomically. */
};

/** 
 * Sets an associated value for a given object using a given key and association policy.
 * 
 * @param object The source object for the association.
 * @param key The key for the association.
 * @param value The value to associate with the key key for object. Pass nil to clear an existing association.
 * @param policy The policy for the association. For possible values, see “Associative Object Behaviors.”
 * 
 * @see objc_setAssociatedObject
 * @see objc_removeAssociatedObjects
 */
OBJC_EXPORT void
objc_setAssociatedObject(id _Nonnull object, const void * _Nonnull key,
                         id _Nullable value, objc_AssociationPolicy policy)
    OBJC_AVAILABLE(10.6, 3.1, 9.0, 1.0, 2.0);

/** 
 * Returns the value associated with a given object for a given key.
 * 
 * @param object The source object for the association.
 * @param key The key for the association.
 * 
 * @return The value associated with the key \e key for \e object.
 * 
 * @see objc_setAssociatedObject
 */
OBJC_EXPORT id _Nullable
objc_getAssociatedObject(id _Nonnull object, const void * _Nonnull key)
    OBJC_AVAILABLE(10.6, 3.1, 9.0, 1.0, 2.0);

/** 
 * Removes all associations for a given object.
 * 
 * @param object An object that maintains associated objects.
 * 
 * @note The main purpose of this function is to make it easy to return an object 
 *  to a "pristine state”. You should not use this function for general removal of
 *  associations from objects, since it also removes associations that other clients
 *  may have added to the object. Typically you should use \c objc_setAssociatedObject 
 *  with a nil value to clear an association.
 * 
 * @see objc_setAssociatedObject
 * @see objc_getAssociatedObject
 */
OBJC_EXPORT void
objc_removeAssociatedObjects(id _Nonnull object)
    OBJC_AVAILABLE(10.6, 3.1, 9.0, 1.0, 2.0);
```


# objc_AssociationPolicy 枚举

|枚举值|等效@property|描述|
|:--|:--|:--|
|OBJC_ASSOCIATION_ASSIGN| @property (assign) 或 @property (unsafe_unretained) | 指定一个关联对象的弱引用.行为上更像 unsafe_unretained 属性 ,要相当小心|
|OBJC_ASSOCIATION_RETAIN_NONATOMIC| @property (nonatomic, strong) | 指定一个关联对象的强引用，不能被原子化使用。|
|OBJC_ASSOCIATION_COPY_NONATOMIC| @property (nonatomic, copy) | 指定一个关联对象的copy引用，不能被原子化使用。|
|OBJC_ASSOCIATION_RETAIN| @property (atomic, strong)  | 指定一个关联对象的强引用，能被原子化使用。 |
|OBJC_ASSOCIATION_COPY |@property (atomic, copy)| 指定一个关联对象的copy引用，能被原子化使用。|

# 释放

被关联的对象在生命周期内要比对象本身释放的晚很多。它们会在被 NSObject -dealloc 调用的 object_dispose() 方法中释放。

# 删除

objc_removeAssociatedObjects() 
不应该自己手动调用这个函数。
规范的方法是：调用 objc_setAssociatedObject 方法并传入一个 nil 值来清除一个关联。

# 示例

AFNetworking在 UIImageView 的category上用了关联对象来保持一个operation对象，用于从网络上某URL异步地获取一张图片。

# 反例（不适合用关联属性的地方）

- 当继承比扩展原有的类更方便时用子类化。
- 为事件的响应者添加响应动作。
- 当响应动作不方便使用时使用的手势动作捕捉。
- 行为可以在其他对象中被代理实现时要用代理(delegate)。
- 用NSNotification 和 NSNotificationCenter进行松耦合化的跨系统的事件通知。

# 参考

>[Associated Objects](https://nshipster.cn/associated-objects/)
>[AFNetworking](https://github.com/AFNetworking/AFNetworking)
>[NSHipster](https://nshipster.com)