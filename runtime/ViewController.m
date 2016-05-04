//
//  ViewController.m
//  runtime
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+RuntimeTest.h"

#import "CustomClass.h"
@interface ViewController ()
@property (nonatomic , strong) NSString *name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _name = @"xiaonan";
//    
//    
//    CustomClass *tmp = [self testRunTime:@"CustomClass" age:@"089"];
//    
//    NSLog(@"tmp.age = %@",tmp.age);

    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 200)];
    [btn setBackgroundColor:[UIColor redColor]];
    btn.timeInterval = 2;
    [btn addTarget:self action:@selector(ffff) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)ffff{

    NSLog(@"haha");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
