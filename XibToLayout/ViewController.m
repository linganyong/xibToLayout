//
//  ViewController.m
//  XibToLayout
//
//  Created by lgy on 2018/10/30.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "ViewController.h"
#import "LGYXibToLayoutDefault.h"
#import "RegisterView.h"

@interface ViewController ()

@property (nonatomic,strong) RegisterView *registerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self goStart];
    [self add];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self add];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) goStart{
//    self.view = [[LGYXibToLayoutDefault new] getXibFrom:@"RegisterView" toClassName:@"RegisterView" isXibSimple:true];;
}


-(void) add{
     [self.view addSubview:self.registerView];
    [self.registerView.topXib equalTo:self.view.topXib constant:0];
    [self.registerView.leftXib equalTo:self.view.leftXib constant:0];
    [self.registerView.rightXib equalTo:self.view.rightXib constant:0];
    [self.registerView.bottomXib equalTo:self.view.bottomXib constant:0];
}

#pragma mark -- get

-(RegisterView *) registerView{
    if(!_registerView){
        _registerView = [[RegisterView alloc] init];
        _registerView.nextBtn.backgroundColor = [UIColor yellowColor];
//        _registerView.translatesAutoresizingMaskIntoConstraints = NO;
        _registerView.backImageView.backgroundColor = [UIColor blueColor];
        _registerView.backgroundColor =  [UIColor greenColor];
        [_registerView xibLayoutView];
    }
    return _registerView;
}


@end
