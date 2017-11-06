//
//  ViewController.m
//  LocalPodDemo
//
//  Created by 周勇 on 2017/10/16.
//  Copyright © 2017年 jryzt. All rights reserved.
//

#import "ViewController.h"
#import <LocalPod/LocalPodTest.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LocalPodTest *test = [LocalPodTest new];
    [test doTest];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
