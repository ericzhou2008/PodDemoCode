//
//  JKCoderProtocol.h
//  demo
//
//  Created by 周勇 on 2017/10/24.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import <Foundation/Foundation.h>
//UITableView
//@protocol UITableViewDelegate<NSObject, UIScrollViewDelegate>

/**
 创建协议(Protocol)、分类(Category)，匿名分类(Extension)：1、command+N，2、选Objective-C File
 
 协议
 协议继承
 @required
 @optional
 
 遵循协议
 实习协议
 */
// 1、申明协议
@protocol JKCoderProtocol <NSObject>

@optional
- (void)jk_dailyMeeting;

@required

@property (assign, nonatomic) NSUInteger age;
@property (copy, nonatomic) NSString *gender;

- (void)jk_talk;



@end
