//
//  HMultipleDelegate.m
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/1/26.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import "HMultipleDelegate.h"
#import <objc/runtime.h>

@interface HMultipleDelegate ()

// 防止循环引用
@property (nonatomic, strong) NSPointerArray *weakRefTargets;

@end

@implementation HMultipleDelegate

- (void)setDelegateTargets:(NSArray *)delegateTargets
{
    self.weakRefTargets = [NSPointerArray weakObjectsPointerArray];
    for (id delegate in delegateTargets) {
        [self.weakRefTargets addPointer:(__bridge void * _Nullable)(delegate)];
    }
}

#pragma mark - 消息“群”转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (id target in self.weakRefTargets) {
            signature = [target methodSignatureForSelector:aSelector];
            if (signature) break;
        }
    }
    return signature;
}

//转发方法调用给所有delegate
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    for (id target in self.weakRefTargets) {
        if ([target respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}

#pragma mark - 重写是否响应方法
- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([super respondsToSelector:aSelector]) return YES;
    
    for (id target in self.weakRefTargets) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }
    
    return NO;
}

@end
