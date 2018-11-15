//
//
//代码生成 工具 LGYXibToLayoutDefault
//

#import "RegisterView.h"


@implementation RegisterView

#pragma mark - LGYXibToLayoutDefault

-(void) xibLayoutView{
    [self addSubview:self.backImageView]; //背景图片
    [self addSubview:self.backBtn]; //返回按钮
    [self addSubview:self.label1]; //请输入
    [self addSubview:self.label2]; //电话号码
    [self addSubview:self.areaBtn]; //电话区号
    [self addSubview:self.line1]; //区号下划线
    [self addSubview:self.phoneTextField]; //填写电话号码
    [self addSubview:self.lin2]; //电话部分下划线
    [self addSubview:self.nextBtn]; //下一步
    
    
    [self.backImageView.leftXib equalTo:self.leftXib constant:0.00];
    [self.backImageView.rightXib equalTo:self.rightXib constant:0.00];
    [self.backImageView.topXib equalTo:self.topXib constant:0.00];
    [self.backImageView.bottomXib equalTo:self.bottomXib constant:0.00];
    
    [self.backBtn.topXib equalTo:self.topXib constant:0.00];
    [self.backBtn.leadingXib equalTo:self.leadingXib constant:16.00];
    [self.backBtn.heightXib equalTo:nil constant:40.00];
    [self.backBtn.widthXib equalTo:nil constant:40.00];
    
    [self.label1.trailingXib equalTo:self.trailingXib constant:-123.00];
    [self.label1.heightXib equalTo:nil constant:21.00];
    
    [self.label2.trailingXib equalTo:self.trailingXib constant:-123.00];
    [self.label2.leadingXib equalTo:self.label1.leadingXib constant:0.00];
    [self.label2.topXib equalTo:self.label1.bottomXib constant:8.00];
    [self.label2.heightXib equalTo:nil constant:21.00];
    
    [self.areaBtn.leadingXib equalTo:self.label1.leadingXib constant:0.00];
    [self.areaBtn.heightXib equalTo:nil constant:30.00];
    [self.areaBtn.widthXib equalTo:nil constant:46.00];
    
    [self.line1.leadingXib equalTo:self.areaBtn.leadingXib constant:-8.00];
    [self.line1.topXib equalTo:self.areaBtn.bottomXib constant:8.00];
    [self.line1.trailingXib equalTo:self.areaBtn.trailingXib constant:8.00];
    [self.line1.heightXib equalTo:nil constant:1.00];
    
    [self.phoneTextField.topXib equalTo:self.areaBtn.topXib constant:0.00];
    [self.phoneTextField.topXib equalTo:self.label2.bottomXib constant:100.00];
    [self.phoneTextField.centerYXib equalTo:self.centerYXib constant:0.00];
    [self.phoneTextField.leadingXib equalTo:self.areaBtn.trailingXib constant:30.00];
    [self.phoneTextField.bottomXib equalTo:self.areaBtn.bottomXib constant:0.00];
    [self.phoneTextField.widthXib equalTo:nil constant:199.00];
    [self.phoneTextField.heightXib equalTo:nil constant:30.00];
    
    [self.lin2.leadingXib equalTo:self.phoneTextField.leadingXib constant:-8.00];
    [self.lin2.topXib equalTo:self.phoneTextField.bottomXib constant:8.00];
    [self.lin2.trailingXib equalTo:self.phoneTextField.trailingXib constant:8.00];
    [self.lin2.heightXib equalTo:nil constant:1.00];
    
    [self.nextBtn.centerXXib equalTo:self.centerXXib constant:0.00];
    [self.nextBtn.leadingXib equalTo:self.line1.leadingXib constant:0.00];
    [self.nextBtn.topXib equalTo:self.line1.bottomXib constant:78.00];
    [self.nextBtn.trailingXib equalTo:self.lin2.trailingXib constant:0.00];
    [self.nextBtn.widthXib equalTo:nil constant:291.00];
    [self.nextBtn.heightXib equalTo:nil constant:40.00];
    
}

//背景图片
-(UIImageView *) backImageView{
    if(!_backImageView){
        _backImageView = [[UIImageView alloc] init];
        
    }
    return _backImageView;
}

//返回按钮
-(UIButton *) backBtn{
    if(!_backBtn){
        _backBtn = [[UIButton alloc] init];
        
    }
    return _backBtn;
}

//请输入
-(UILabel *) label1{
    if(!_label1){
        _label1 = [[UILabel alloc] init];
        
    }
    return _label1;
}

//电话号码
-(UILabel *) label2{
    if(!_label2){
        _label2 = [[UILabel alloc] init];
        
    }
    return _label2;
}

//电话区号
-(UIButton *) areaBtn{
    if(!_areaBtn){
        _areaBtn = [[UIButton alloc] init];
        
    }
    return _areaBtn;
}

//区号下划线
-(UIView *) line1{
    if(!_line1){
        _line1 = [[UIView alloc] init];
        
    }
    return _line1;
}

//填写电话号码
-(UITextField *) phoneTextField{
    if(!_phoneTextField){
        _phoneTextField = [[UITextField alloc] init];
        
        
        
    }
    return _phoneTextField;
}

//电话部分下划线
-(UIView *) lin2{
    if(!_lin2){
        _lin2 = [[UIView alloc] init];
        
    }
    return _lin2;
}

//下一步
-(UIButton *) nextBtn{
    if(!_nextBtn){
        _nextBtn = [[UIButton alloc] init];
        
    }
    return _nextBtn;
}

@end
