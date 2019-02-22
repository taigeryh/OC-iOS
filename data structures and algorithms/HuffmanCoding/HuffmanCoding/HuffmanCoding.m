//
//  HuffmanCoding.m
//  HuffmanCoding
//
//  Created by tyh on 2019/2/15.
//  Copyright © 2019 tyh. All rights reserved.
//

#import "HuffmanCoding.h"
#import "Node.h"
#import "NSString+Byte.h"


static NSString * strings = @"";

@interface HuffmanCoding ()

//@property (nonatomic, copy) NSString * strings;
@property (nonatomic, strong) NSMutableDictionary *huffCodes;

@end

@implementation HuffmanCoding

- (NSMutableDictionary *)huffCodes {
    if (_huffCodes == nil) {
        _huffCodes = [[NSMutableDictionary alloc] init];
    }
    return _huffCodes;
}

+ (Byte*)zip:(Byte*)bytes length:(NSUInteger)length {
    
    // 统计每一个byte出现的次数，并放入一个集合中
    NSMutableArray *nodes = [self nodes:bytes length:length];
    
    // 创建一个赫夫曼树
    Node *root = [self createHuffmanTree:nodes];
    
    // 创建一个赫夫曼编码表
    NSDictionary * codes = [[[self alloc] init] codes:root];
    NSLog(@"%@",codes);
    
    // 编码
    return [self zip:bytes length:length map:codes];

}


+ (Byte *)zip:(Byte*)bytes length:(NSUInteger)length map:(NSDictionary*)dict {
    NSMutableString * str = [[NSMutableString alloc] init];
    for (int i=0; i<length; i++) {
        NSString *key = [NSString stringWithFormat:@"%d",bytes[i]];
        [str appendString:dict[key]];
    }
    return [str toBytes];
}


// 创建一个赫夫曼编码表
- (NSDictionary<NSString*,NSString*>*)codes:(Node*)tree {
    if (tree == nil) {
        return nil;
    }
    [self codesWith:tree.left code:@"0" string:strings];
    [self codesWith:tree.right code:@"1" string:strings];
    return self.huffCodes;
}

- (void)codesWith:(Node *)node code:(NSString *)code string:(NSString*)string {
    NSMutableString *str2 = [NSMutableString stringWithString:string];
    [str2 appendString:code];
    if (node.data == 0) {
        [self codesWith:node.left code:@"0" string:str2];
        [self codesWith:node.right code:@"1" string:str2];
    } else {
        [self.huffCodes setObject:str2 forKey:[NSString stringWithFormat:@"%d",node.data]];
    }
}



// 统计每一个byte出现的次数，并放入一个集合中
+ (NSMutableArray *)nodes:(Byte*)bytes length:(NSUInteger)length {
    // 统计每一个byte出现的次数，并放入一个集合中
    NSMutableArray *nodes = [[NSMutableArray alloc] init];
    
    // string, number  用于计数
    NSMutableDictionary<NSString *, NSNumber*> *dict = [NSMutableDictionary dictionary];
    
    for (int i=0; i<length; i++) {
        Byte b = bytes[i];
        NSString * key = [NSString stringWithFormat:@"%d",b];
        NSNumber * n = [dict objectForKey:key];
        if (n == nil) {
            [dict setObject:@1 forKey:key];
        }else{
            [dict setObject:@(n.integerValue+1) forKey:key];
        }
    }
    
    NSLog(@"%@",dict);
    
    // 把每一个字典 kv 转为一个 node 对象
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
        Byte b = (Byte)key;
        NSInteger weight = obj.integerValue;
        Node *n = [[Node alloc] initWithData:b weight:weight];
        [nodes addObject:n];
    }];
    
    return nodes;
}


// 创建一个赫夫曼树
+ (Node *)createHuffmanTree:(NSMutableArray *)nodes {
    
    // 创建一个赫夫曼树
    while (nodes.count > 1) {
        // 排序
        [nodes sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            Node *o1 = (Node*)obj1;
            Node *o2 = (Node*)obj2;
            // 权值 从大到小
            return (o1.weight > o2.weight)?NSOrderedAscending:NSOrderedDescending;
        }];
        // 取出权值最小的两个二叉树
        Node *left = nodes[nodes.count-1];
        Node *right = nodes[nodes.count-2];
        
        // 创建新的二叉树  没有内容
        Node *parent = [[Node alloc] initWithData:0 weight:left.weight+right.weight ];
        parent.left = left;
        parent.right = right;
        
        // 把原来的两个二叉树移除。
        [nodes removeObject:left];
        [nodes removeObject:right];
        
        // 放入原来的二叉树集合中。
        [nodes addObject:parent];
    }
    
    Node *root = nodes[0];
    Node *left = root.left;
    Node *right = root.right;
    
    NSLog(@"%d = %d = %d",root.data,left.data,right.data);
    NSLog(@"%d = %d = %d",root.weight,left.weight,right.weight);
    
    return root;
}

@end
