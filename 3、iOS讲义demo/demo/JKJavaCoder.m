//
//  JKJavaCoder.m
//  demo
//
//  Created by 周勇 on 2017/10/23.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "JKJavaCoder.h"

@implementation JKJavaCoder
@synthesize company = _company;

- (void)showAbility {
    NSLog(@"i am a %@, i can use %@ coding", NSStringFromClass([self class]), self.abilityArray);
}

- (void)setCompany:(NSString *)company {
    _company = company;
}

- (NSString *)company {
    return _company;
}

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
@end
