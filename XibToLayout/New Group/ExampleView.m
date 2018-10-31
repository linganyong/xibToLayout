//
//
//代码生成 工具 LGYXibToLayoutDefault 
//
 
#import "ExampleView.h" 


@implementation ExampleView  

#pragma mark - LGYXibToLayoutDefault 

//案例view 
-(void) xibLayoutView{ 
[self addSubview:self.headerView]; //案例view add 头部文件
[self addSubview:self.secondView]; //案例view add 
[self addSubview:self.view1]; //案例view add 
[self addSubview:self.view2]; //案例view add 

[self.xib_bottom  equalTo:self.view1.xib_bottom  multiplier:1.000000 constant:330.000000];
[self.xib_trailing  equalTo:self.view2.xib_trailing  multiplier:1.000000 constant:16.000000];
[self.xib_trailing  equalTo:self.headerView.xib_trailing  multiplier:1.000000 constant:16.000000];
[self.headerView.xib_top  equalTo:self.xib_top  multiplier:1.000000 constant:0.000000];
[self.headerView.xib_leading  equalTo:self.xib_leading  multiplier:1.000000 constant:16.000000];
[self.view1.xib_leading  equalTo:self.xib_leading  multiplier:1.000000 constant:16.000000];
[self.view1.xib_top  equalTo:self.secondView.xib_bottom  multiplier:1.000000 constant:20.500000];
[self.view1.xib_trailing  equalTo:self.xib_trailing  multiplier:1.000000 constant:0.000000];
[self.secondView.xib_top  equalTo:self.headerView.xib_bottom  multiplier:1.000000 constant:33.000000];
[self.secondView.xib_centerX  equalTo:self.headerView.xib_centerX  multiplier:1.000000 constant:0.000000];
[self.view2.xib_top  equalTo:self.view1.xib_bottom  multiplier:1.000000 constant:71.000000];
[self.view2.xib_leading  equalTo:self.xib_leading  multiplier:1.000000 constant:16.000000];
[self.view2.xib_height  equalTo:self.view1_2_1.xib_height  multiplier:1.000000 constant:0.000000];

[self.headerView.xib_width  equalTo:self.headerView.xib_height  multiplier:3.000000 constant:0.000000];

[self.secondView.xib_width  equalTo:self.secondView.xib_height  multiplier:2.000000 constant:0.000000];
[self.secondView.xib_width  equalTo:nil  multiplier:1.000000 constant:42.000000];

[self.view1_1.xib_top  equalTo:self.view1.xib_top  multiplier:1.000000 constant:20.000000];
[self.view1_1.xib_leading  equalTo:self.view1.xib_leading  multiplier:1.000000 constant:0.000000];
[self.view1.xib_bottom  equalTo:self.view1_2.xib_bottom  multiplier:1.000000 constant:-8.000000];
[self.view1_2.xib_top  equalTo:self.view1.xib_top  multiplier:1.000000 constant:8.000000];
[self.view1_2.xib_leading  equalTo:self.view1_1.xib_trailing  multiplier:1.000000 constant:8.000000];
[self.view1.xib_trailing  equalTo:self.view1_2.xib_trailing  multiplier:1.000000 constant:0.000000];
[self.view1_2.xib_leading  equalTo:self.view1_1.xib_trailing  multiplier:1.000000 constant:8.000000];
 
}

//头部文件 
-(UILabel *) headerView{
 if(!_headerView){
 _headerView = [[UILabel alloc] init]; 
_headerView.translatesAutoresizingMaskIntoConstraints = NO;  
} 
 return _headerView;  
}

-(UILabel *) secondView{
 if(!_secondView){
 _secondView = [[UILabel alloc] init]; 
_secondView.translatesAutoresizingMaskIntoConstraints = NO;  
} 
 return _secondView;  
}

-(UIView *) view1{
 if(!_view1){
 _view1 = [[UIView alloc] init]; 
_view1.translatesAutoresizingMaskIntoConstraints = NO;
[_view1 addSubview:self.view1_1]; 
[_view1 addSubview:self.view1_2]; 

[self.view1_1.xib_width  equalTo:nil  multiplier:1.000000 constant:157.000000];
[self.view1_1.xib_height  equalTo:nil  multiplier:1.000000 constant:108.000000];

[self.view1_2_1.xib_leading  equalTo:self.view1_2.xib_leading  multiplier:1.000000 constant:85.000000];
[self.view1_2_1.xib_top  equalTo:self.view1_2.xib_top  multiplier:1.000000 constant:23.000000];  
} 
 return _view1;  
}

-(UIView *) view1_1{
 if(!_view1_1){
 _view1_1 = [[UIView alloc] init]; 
_view1_1.translatesAutoresizingMaskIntoConstraints = NO;  
} 
 return _view1_1;  
}

-(UIView *) view1_2{
 if(!_view1_2){
 _view1_2 = [[UIView alloc] init]; 
_view1_2.translatesAutoresizingMaskIntoConstraints = NO;
[_view1_2 addSubview:self.view1_2_1]; 

[self.view1_2_1.xib_height  equalTo:nil  multiplier:1.000000 constant:105.000000];
[self.view1_2_1.xib_width  equalTo:nil  multiplier:1.000000 constant:101.000000];
[self.view1_2_1.xib_bottom  equalTo:self.view1_2_1_1.xib_bottom  multiplier:1.000000 constant:28.000000];
[self.view1_2_1.xib_trailing  equalTo:self.view1_2_1_1.xib_trailing  multiplier:1.000000 constant:8.000000];
[self.view1_2_1_1.xib_top  equalTo:self.view1_2_1.xib_top  multiplier:1.000000 constant:27.000000];
[self.view1_2_1_1.xib_leading  equalTo:self.view1_2_1.xib_leading  multiplier:1.000000 constant:27.000000];  
} 
 return _view1_2;  
}

-(UIView *) view1_2_1{
 if(!_view1_2_1){
 _view1_2_1 = [[UIView alloc] init]; 
_view1_2_1.translatesAutoresizingMaskIntoConstraints = NO;
[_view1_2_1 addSubview:self.view1_2_1_1]; 

[self.view1_2_1_1.xib_width  equalTo:nil  multiplier:1.000000 constant:66.000000];
[self.view1_2_1_1.xib_height  equalTo:nil  multiplier:1.000000 constant:50.000000];  
} 
 return _view1_2_1;  
}

-(UIView *) view1_2_1_1{
 if(!_view1_2_1_1){
 _view1_2_1_1 = [[UIView alloc] init]; 
_view1_2_1_1.translatesAutoresizingMaskIntoConstraints = NO;  
} 
 return _view1_2_1_1;  
}

-(UIView *) view2{
 if(!_view2){
 _view2 = [[UIView alloc] init]; 
_view2.translatesAutoresizingMaskIntoConstraints = NO;  
} 
 return _view2;  
}

@end