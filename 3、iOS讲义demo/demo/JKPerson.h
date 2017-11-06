//
//  JKPerson.h
//  demo
//
//  Created by 周勇 on 2017/10/23.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKPerson : NSObject {
    // 成员变量
    @public
    NSString *_nickname;
    
    @protected//缺省
    NSString *_province;
}
- (void)eat;
- (void)run;


/**
 属性
 */
@property (copy, nonatomic) NSString *name;
@end
