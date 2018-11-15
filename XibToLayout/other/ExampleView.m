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
    
    
    [self.headerView.xib_trailing  equalTo:self.xib_trailing constant:-16.00];
    [self.headerView.xib_top  equalTo:self.xib_top constant:0.00];
    [self.headerView.xib_leading  equalTo:self.xib_leading constant:16.00];
    [self.headerView.xib_width  equalTo:self.headerView.xib_height constant:0.00 multiplier:3.00];
    
    [self.secondView.xib_top  equalTo:self.headerView.xib_bottom constant:33.00];
    [self.secondView.xib_centerX  equalTo:self.headerView.xib_centerX constant:0.00];
    [self.secondView.xib_width  equalTo:self.secondView.xib_height constant:0.00 multiplier:2.00];
    [self.secondView.xib_width  equalTo:nil constant:42.00];
    
    [self.view1.xib_bottom  equalTo:self.xib_bottom constant:-330.00];
    [self.view1.xib_leading  equalTo:self.xib_leading constant:16.00];
    [self.view1.xib_top  equalTo:self.secondView.xib_bottom constant:20.50];
    [self.view1.xib_trailing  equalTo:self.xib_trailing constant:0.00];
    [self.view1.xib_bottom  equalTo:self.view1_2.xib_bottom constant:-8.00];
    [self.view1.xib_trailing  equalTo:self.view1_2.xib_trailing constant:0.00];
    
    [self.view2.xib_trailing  equalTo:self.xib_trailing constant:-16.00];
    [self.view2.xib_top  equalTo:self.view1.xib_bottom constant:71.00];
    [self.view2.xib_leading  equalTo:self.xib_leading constant:16.00];
    [self.view2.xib_height  equalTo:self.view1_2_1.xib_height constant:0.00];
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
        
        [self.view1_1.xib_top  equalTo:self.view1.xib_top constant:20.00];
        [self.view1_1.xib_leading  equalTo:self.view1.xib_leading constant:0.00];
        [self.view1_1.xib_width  equalTo:nil constant:157.00];
        [self.view1_1.xib_height  equalTo:nil constant:108.00];
        
        [self.view1_2.xib_top  equalTo:self.view1.xib_top constant:8.00];
        [self.view1_2.xib_leading  equalTo:self.view1_1.xib_trailing constant:8.00];
        [self.view1_2.xib_leading  equalTo:self.view1_1.xib_trailing constant:8.00];
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
        
        [self.view1_2_1.xib_leading  equalTo:self.view1_2.xib_leading constant:85.00];
        [self.view1_2_1.xib_top  equalTo:self.view1_2.xib_top constant:23.00];
        [self.view1_2_1.xib_height  equalTo:nil constant:105.00];
        [self.view1_2_1.xib_width  equalTo:nil constant:101.00];
        [self.view1_2_1.xib_bottom  equalTo:self.view1_2_1_1.xib_bottom constant:28.00];
        [self.view1_2_1.xib_trailing  equalTo:self.view1_2_1_1.xib_trailing constant:8.00];
    }
    return _view1_2;
}

-(UIView *) view1_2_1{
    if(!_view1_2_1){
        _view1_2_1 = [[UIView alloc] init];
        _view1_2_1.translatesAutoresizingMaskIntoConstraints = NO;
        [_view1_2_1 addSubview:self.view1_2_1_1];
        
        [self.view1_2_1_1.xib_top  equalTo:self.view1_2_1.xib_top constant:27.00];
        [self.view1_2_1_1.xib_leading  equalTo:self.view1_2_1.xib_leading constant:27.00];
        [self.view1_2_1_1.xib_width  equalTo:nil constant:66.00];
        [self.view1_2_1_1.xib_height  equalTo:nil constant:50.00];
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
