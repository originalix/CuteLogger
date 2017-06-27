//
//  TestObjcViewController.m
//  CuteLogger
//
//  Created by Lix on 2017/6/26.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "TestObjcViewController.h"
#import "CuteLogger-Swift.h"
#import "LogObjcConst.h"

@interface TestObjcViewController ()

@end

@implementation TestObjcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    LogGenerator *log = [[LogGenerator alloc] init];
//    NSString *str = [NSString stringWithFormat:@"%s", __FUNCTION__];
//    NSInteger line = (NSInteger)__LINE__;
//    [log debugWithTargetClass:self.classForCoder content:@"测试Objc-log" :line :str];
//    [[LogGenerator new] debugWithTargetClass:self.classForCoder content:[NSString stringWithFormat:@"%@", log] :(NSInteger)__LINE__ :[NSString stringWithFormat:@"%s", __FUNCTION__]];
    Cute_Debug(@"这是一个Debug - Log")
    Cute_Info(@"这是一个info - Log")
    Cute_Error(@"这是一个Error - Log")
    Cute_Warning(@"这是一个 Warning - Log")
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
