//
//  JKPerson+ADD.h
//  demo
//
//  Created by 周勇 on 2017/10/24.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "JKPerson.h"
// category 只能添加方法、不能添加成员变量，添加变量需要用到runtime的知识
@interface JKPerson (ADD)
- (void)jk_categoryMsg;

@property (copy, nonatomic) NSString *nickname;
@end
