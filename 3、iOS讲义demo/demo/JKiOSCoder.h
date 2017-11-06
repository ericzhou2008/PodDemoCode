//
//  JKiOSCoder.h
//  demo
//
//  Created by 周勇 on 2017/10/23.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "JKPerson.h"
#import "JKCoderProtocol.h"

@interface JKiOSCoder : JKPerson<JKCoderProtocol> // 2、遵循委托协议
//{
//    NSArray<NSString *> *_abilityArray; // 申明成员变量
//}
@property (copy, nonatomic) NSArray<NSString *> *abilityArray;

// 老式写法
//- (void)setAbilityArray:(NSArray<NSString *> *)abilityArray;
//- (NSArray<NSString *> *)abilityArray;

@property (copy, nonatomic) NSString *company;
- (void)showAbility;

- (NSString *)showiOSAbility;


#pragma mark - JKCoderProtocol
// 4、实现委托协议
@property (assign, nonatomic) NSUInteger age;
@property (copy, nonatomic) NSString *gender;
@end
