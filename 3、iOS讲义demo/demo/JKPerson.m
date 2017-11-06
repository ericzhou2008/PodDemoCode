//
//  JKPerson.m
//  demo
//
//  Created by 周勇 on 2017/10/23.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "JKPerson.h"
#import "JKPerson+ADD.h"




// extension=匿名category，可以添加方法和成员变量，与本类公用一个实现
@interface JKPerson()
{
    float _height;
}
@property (assign, nonatomic) double depositBalance;
@end


/**
 实现
 */
@implementation JKPerson
@synthesize name;

- (void)run {
    NSLog(@"i can run");
}

- (void)eat; {
    NSLog(@"i can eat");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name           = @"eric";

        self.nickname       = @"my nickname is 程序猿";
        _height             = 18.4f;
        _province           = @"湖南";

        self.depositBalance = 5000000.f;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%@--%s", NSStringFromClass([self class]), __PRETTY_FUNCTION__);
}
@end
