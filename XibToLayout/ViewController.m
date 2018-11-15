//
//  ViewController.m
//  XibToLayout
//
//  Created by lgy on 2018/10/30.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "ViewController.h"
#import "LGYXibToLayoutDefault.h"


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
   // [self add];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) goStart{
    self.view = [[LGYXibToLayoutDefault new] getXibFrom:@"RegisterView" toClassName:@"RegisterView" isXibSimple:true];;
}






@end
