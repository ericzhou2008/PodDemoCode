//
//  JKJavaCoder.h
//  demo
//
//  Created by 周勇 on 2017/10/23.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "JKPerson.h"

@interface JKJavaCoder : JKPerson
@property (copy, nonatomic) NSString *company;
@property (copy, nonatomic) NSArray<NSString *> *abilityArray;

- (void)showAbility;
@end
