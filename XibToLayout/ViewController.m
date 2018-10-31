//
//  ViewController.m
//  XibToLayout
//
//  Created by lgy on 2018/10/30.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "ViewController.h"
#import "LGYXibToLayoutDefault.h"
#import "ExampleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self goStart];
//    [self add];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self add];
}

-(void) add{
    ExampleView *view =  [[ExampleView alloc] init];
    [view xibLayoutView];
    [self.view addSubview:view];
    view.frame = [UIScreen mainScreen].bounds;

    view.backgroundColor = [UIColor grayColor];
    view.headerView.backgroundColor = [UIColor yellowColor];
    view.secondView.backgroundColor = [UIColor blueColor];
    view.view1.backgroundColor = [UIColor blackColor];
    view.view2.backgroundColor = [UIColor redColor];
    view.view1_1.backgroundColor = [UIColor redColor];
    view.view1_2.backgroundColor = [UIColor yellowColor];
    view.view1_2_1.backgroundColor = [UIColor grayColor];
    view.view1_2_1_1.backgroundColor = [UIColor blueColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) goStart{
    self.view = [[LGYXibToLayoutDefault new] getXibFrom:@"View" toClassName:@"ExampleView" isXibSimple:false];;
}






@end
