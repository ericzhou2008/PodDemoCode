//
//  ViewController.m
//  demo
//
//  Created by 周勇 on 2017/10/23.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "ViewController.h"
#import "JKPerson+ADD.h"
#import "JKiOSCoder.h"
#import "JKCoderProtocol.h"

#define JKUseWeek

//@protocol JKCoderProtocol<NSObject>
//
//@required
//@property (assign, nonatomic) NSUInteger age;
//@property (assign, nonatomic) NSUInteger gender;
//
//- (void)jk_talk;
//
//@optional
//- (NSString *)isLeader;
//@end

@interface ViewController ()
// 2、委托代理
@property (nonatomic, weak)  id <JKCoderProtocol> delegate;

/**
 assign(__unsafe_unretained)弱引用，引用对象被释放后 不会不会不会 自动置为nil
 */
@property (assign, nonatomic) JKPerson *unsafeUnretainPerson;

/**
 weak 弱引用，被释放后自动设置为nil
 */
@property (weak, nonatomic) JKPerson *weekPerson;

/*
 修改setter getter方法名
 */
@property (assign, nonatomic, getter=isMyAge, setter=setMyAge:) NSUInteger age;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JKPerson *aPerson = [JKPerson new];
    [aPerson jk_categoryMsg]; // 调用JKPerson+ADD分类方法
    
    NSLog(@"%@, aPerson->_nickname=%@", aPerson, aPerson->_nickname);

    [self setMyAge:10];
    
#ifdef JKUseWeek
    self.weekPerson = aPerson;
#else
    self.unsafeUnretainPerson = aPerson;
#endif
    
    JKiOSCoder *iosCoder = [[JKiOSCoder alloc] init];
    [iosCoder showAbility];
    
    // 3、设置代理委托(可以把self看成项目的甲方，iosCoder为乙方，JKCoderProtocol看成甲乙双方签订的合同)
    self.delegate = iosCoder;
    // 5、调用委托协议方法
    if ([self.delegate respondsToSelector:@selector(jk_talk)]) {
        [self.delegate jk_talk];
        [self.delegate jk_dailyMeeting];
        NSLog(@"gender=%@,age=%ld", self.delegate.gender, self.age);
    }
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
#ifdef JKUseWeek
    NSLog(@"weekPerson=%@", self.weekPerson);
    
    [self.weekPerson eat];
#else
    NSLog(@"unsafeUnretainPerson=%@", self.unsafeUnretainPerson);
    
    [self.unsafeUnretainPerson eat];
#endif
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
