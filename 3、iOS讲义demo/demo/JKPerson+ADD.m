//
//  JKPerson+ADD.m
//  demo
//
//  Created by 周勇 on 2017/10/24.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "JKPerson+ADD.h"
#import <objc/runtime.h>

/**
 列别Add的实现
 */
@implementation JKPerson (ADD)
// runtime 动态添加成员变量
@dynamic nickname;
- (NSString *)nickname {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setNickname:(NSString *)nickname {
    objc_setAssociatedObject(self, @selector(nickname), nickname, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)jk_categoryMsg {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
@end
