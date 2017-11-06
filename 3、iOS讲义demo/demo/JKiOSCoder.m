//
//  JKiOSCoder.m
//  demo
//
//  Created by 周勇 on 2017/10/23.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "JKiOSCoder.h"
#import "JKJavaCoder.h"

/**
 typedef block
 */
typedef void (^NoParasNoreturnBlock) (void);
typedef void (^ParasNoreturnBlock) (int, NSString *);
typedef NSString * (^ParasReturnBlock) (int);


// 匿名category,可以申明属性
@interface JKiOSCoder()
@property (strong, nonatomic) JKJavaCoder *javaCoder;

@property (copy, nonatomic) NoParasNoreturnBlock block1;///< 无参数无返回值
@property (copy, nonatomic) ParasNoreturnBlock block2;///< 有参数无返回值
@property (copy, nonatomic) ParasReturnBlock block3; ///< 有参数有返回值
@end

@implementation JKiOSCoder
@synthesize abilityArray = _abilityArray;


- (void)showAbility {
    NSLog(@"i am a %@, i can use %@ coding", NSStringFromClass([self class]), self.abilityArray);
}

#pragma mark - MRC&ARC
- (instancetype)init
{
    self = [super init];
    if (self) {
        // 引用计数 retainCount
        NSLog(@"------------------- 引用计数 retainCount -------------------");
        //NSArray<NSString *> *arr = [NSArray arrayWithObjects:@"iOS", @"C", @"Swift", @"Python", nil];
        NSArray<NSString *> *arr = [[NSArray alloc] initWithObjects:@"iOS", @"C", @"Swift", @"Python", nil];
        NSLog(@"000-arr.retainCount=%ld", arr.retainCount);
        self.abilityArray        = arr;
        NSLog(@"111-arr.retainCount=%ld", arr.retainCount);
        [arr release];
        NSLog(@"222-arr.retainCount=%ld", arr.retainCount);

        self.company             = @"pingan";

        // javaCoder 内存泄露
        NSLog(@"------------------- javaCoder 内存泄露 -------------------");
        JKJavaCoder *javaCoder   = [[JKJavaCoder alloc] init];
        javaCoder.abilityArray   = @[@"java", @"adb", @"react native", @"js"];
        [javaCoder showAbility];

        self.javaCoder           = javaCoder;
        [javaCoder release]; // 不释放javaCoder的retainCount不为0 则将不能释放
        
        
        // block
        [self doBlock];
        
        // KVC:Key-value coding(键值编码)
        NSLog(@"------------------- KVC:Key-value coding(键值编码) -------------------");
        NSString *name1    = [self valueForKey:@"name1"]; ////
        NSString *name     = [self valueForKey:@"name"];
        NSString *province = [self valueForKey:@"province"];
        NSString *nickname = [self valueForKey:@"nickname"];
        float height       = [[self valueForKey:@"height"] floatValue];
        NSLog(@"name1=%@, name=%@, province=%@, nickname=%@, height=%.1f", name1, name, province, nickname, height);
        
        self.age = 10;
        self.gender = @"男";
    }
    //KVO:Key-value observe(键值观察)
    return self;
}

- (NSString *)description {
    return [super description];
}


- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"valueForUndefinedKey=%@", key);
    
    return [NSString stringWithFormat:@"valueForUndefinedKey:%@", key];
}

#pragma mark - setter getter 方法内存管理 还原
/**
 谁污染谁治理，谁创建谁释放
 使用alloc copy mutableCopy new retain消息，则就是使用对应次数是release(autorelease)
 */
- (void)setAbilityArray:(NSArray<NSString *> *)abilityArray {
    static NSUInteger counter = 0;

    if (_abilityArray != abilityArray) {
        NSLog(@"000-%p-%p-abilityArray.retainCount=%ld", _abilityArray, abilityArray, _abilityArray.retainCount);
        counter++;
        
        [_abilityArray release];
        
        _abilityArray = [abilityArray copy];
        
        NSLog(@"222-%p-%p-abilityArray.retainCount=%ld", _abilityArray, abilityArray, _abilityArray.retainCount);
    }
}

- (NSArray<NSString *> *)abilityArray {
    return _abilityArray;
}

- (NSString *)showiOSAbility {
    return [[[NSString alloc] initWithString:@"iOS"] autorelease]; // autorelease使用
}


#pragma mark -  block
- (void)doBlock {
    NSLog(@"------------------- block 申明、实现、调用、内存管理 -------------------");
    // 申明一个无参数无返回值 block
    void(^block1)(void);
    // 实现
    block1 = ^{
        NSLog(@"has no parameter");
    };
    // 调用
    block1();
    
    // 申明并实现一个无参数无返回值 block
    int count1 = 1;
    void(^block2)(int) = ^(int a) {
        //count1++; // 这里不能修改，上面的count1和下面发count1已经不是一个东西因此不能使用
        NSLog(@"has a parameter a = %d", count1+a); // count被拷贝一份到到栈中
    };
    count1++; // 即使这里改变了 但是block2的时候count还是为1
    // 调用
    block2(665);
    
    
    // 申明并实现一个返回NSString数无返回值 block
    __block int count2 = 1;
    __block __typeof(self) weakSelf = self; // MRC写法
//    __weak __typeof(self) weakSelf = self; // ARC写法
    NSString* (^block3)(int) = ^(int aInt) {
        NSLog(@"company=%@", weakSelf.company);
        
        count2++;
        return [NSString stringWithFormat:@"双击%d", aInt+count2]; // count2可以单做是一个全局变量
    };
    // 调用
    count2++;
    NSLog(@"block3=%@", block3(664));
    
    self.block3 = block3;
    NSLog(@"self.block3=%@", self.block3(664));
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

#pragma mark - JKCoderProtocol
// 4、实现委托协议
- (void)jk_talk {
    NSLog(@"%s, hello jk", __PRETTY_FUNCTION__);
}

- (void)jk_dailyMeeting {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

#pragma mark - dealloc


- (void)dealloc
{
    NSLog(@"000-dealloc-abilityArray.retainCount=%ld", self.abilityArray.retainCount);
    
    self.abilityArray = nil; // 相当于以下两行代码
//        [_abilityArray release];
//        _abilityArray = nil;
    
    NSLog(@"self.javaCoder.retainCount=%ld", self.javaCoder.retainCount);
    self.javaCoder = nil;
    
    [super dealloc];
}
@end
