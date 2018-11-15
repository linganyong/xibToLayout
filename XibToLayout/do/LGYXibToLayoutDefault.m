//
//  LGYXibToLayoutDefault.m
//  XibToLayout
//
//  Created by lgy on 2018/10/30.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "LGYXibToLayoutDefault.h"

@interface LGYXibToLayoutDefault()

@property (nonatomic,assign) NSInteger viewCount;
@property (nonatomic,strong) NSString *className;
@property (nonatomic,strong) UIView *backView;

@property (nonatomic,strong) NSMutableArray *allViewS;
@property (nonatomic,strong) NSMutableArray *xibArray;

@end


@implementation LGYXibToLayoutDefault


-(UIView *) getXibFrom:(NSString *)xibName toClassName:(NSString *)className isXibSimple:(BOOL)isXibSimple{
    self.backView = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] firstObject];
    _viewCount = 0;
    _isXibSimple = isXibSimple;
    _className = className;
    self.backView.xibPropertyName = [className lowercaseString];
    [self initContent:self.backView];
    _allViewS = [NSMutableArray arrayWithCapacity:10];
    [_allViewS addObject:self.backView];
    [self getAllView:self.backView];
    [self getContent];
    return self.backView;
}

//找到所有的View
-(void) getAllView:(UIView *)view{
    for (UIView *item in view.subviews) {
        if (item.xibPropertyName.length < 2) {
            item.xibPropertyName = [NSString stringWithFormat:@"view%lu",++_viewCount];
        }
        [self.dataScoureViews addObject:item];
        [_allViewS addObject:item];
        [self getAllView:item];
    }
}

-(void) initContent:(UIView *)view{
    if (!self.proertyContent) {
        if (self.isXibSimple) {
            self.proertyContent = [NSString stringWithFormat:@"//\n//\n//代码生成 工具 LGYXibToLayoutDefault  \n//\n \n#import <UIKit/UIKit.h> \n#import \"UIView+LGYXibToLayout.h\"  \n\n\n@interface %@ : UIView \n",self.className];
        }else{
            self.proertyContent = [NSString stringWithFormat:@"//\n//\n//代码生成 工具 LGYXibToLayoutDefault  \n//\n \n#import <UIKit/UIKit.h> \n\n\n@interface %@ : UIView \n",self.className];
        }
    }
    if (!self.getInitContent) {
        self.getInitContent = [NSString stringWithFormat:@"//\n//\n//代码生成 工具 LGYXibToLayoutDefault \n//\n \n#import \"%@.h\" \n\n\n@implementation %@  \n\n#pragma mark - LGYXibToLayoutDefault ",self.className,self.className];;
    }
    NSString *description = view.xibPropertyDescription;
    // 生成初始化
    NSString *string;
    if (description) {
        string = [NSString stringWithFormat:@"\n\n//%@ \n-(void) xibLayoutView{ $ \n}",description];
    }else{
        string = [NSString stringWithFormat:@"\n\n-(void) xibLayoutView{ $ \n}"];
    }
    
    NSString *content = @"";
    
    // 生成 addSubview
    for (UIView *item in view.subviews) {
        NSString *des = @"";
        NSString *des1 = view.xibPropertyDescription;
        if (des1) {
            des = [des stringByAppendingString:[NSString stringWithFormat:@"%@ add ",des1]];
        }
        NSString *des2 = item.xibPropertyDescription;
        if (des2) {
            des = [des stringByAppendingString:des2];
        }
        if (des.length > 2) {
            des = [@"//" stringByAppendingString:des];
        }
        content = [content stringByAppendingString:[NSString stringWithFormat:@"\n[self addSubview:self.%@]; %@",item.xibPropertyName,des]];
    }
    
    // 生成约束
    content = [content stringByAppendingString:[self getLayoutStringFromView:view]];
    for (UIView *item in view.subviews) {
        content = [content stringByAppendingString:[self getLayoutStringFromView:item]];
    }
    string = [string stringByReplacingOccurrencesOfString:@"$" withString:content];
    self.getInitContent = [self.getInitContent stringByAppendingString:string];
}

// 遍历所有的View,根据每一个View生产相关的代码
-(void) getContent{
    for (UIView *view in self.dataScoureViews) {
        NSString *des1 = view.xibPropertyDescription;
        if (!des1) {
            des1 = @"";
        }
        //生成 属性 部分
        self.proertyContent = [self.proertyContent stringByAppendingString:[NSString stringWithFormat:@" \n@property (nonatomic,strong) %@ *%@; // %@",NSStringFromClass([view class]),view.xibPropertyName,des1]];
        //生成 初始化和布局部分
        [self sssContent:view];
        
    }
    self.proertyContent  = [self.proertyContent stringByAppendingString:@"\n\n-(void) xibLayoutView;\n\n @end"];
    self.getInitContent  = [self.getInitContent stringByAppendingString:@"\n\n@end"];
    [self getAllXibLayout];
    //保存文件
    [self writeToFileHString:self.proertyContent mString:self.getInitContent];
}

// 开始
-(void) sssContent:(UIView *)view{
    NSString *className = NSStringFromClass([view class]);
    NSString *propertyName = view.xibPropertyName;
    NSString *description = view.xibPropertyDescription;
    if ([className containsString:@"_"]) {
        return;
    }
    // 生成初始化
    NSString *string;
    if (description) {
        string = [NSString stringWithFormat:@"\n\n//%@ \n-(%@ *) %@{\n if(!_%@){\n _%@ = [[%@ alloc] init]; $  \n} \n return _%@;  \n}",description,className,propertyName,propertyName,propertyName,className,propertyName];
    }else{
        string = [NSString stringWithFormat:@"\n\n-(%@ *) %@{\n if(!_%@){\n _%@ = [[%@ alloc] init]; $  \n} \n return _%@;  \n}",className,propertyName,propertyName,propertyName,className,propertyName];
    }
    
    NSString *content = [NSString stringWithFormat:@"\n"];
    // 生成 addSubview
    for (UIView *item in view.subviews) {
        NSString *des = @"";
        NSString *des1 = view.xibPropertyDescription;
        if ([NSStringFromClass([item class]) containsString:@"_"]) {
            continue;
        }
        if (des1) {
            des = [des stringByAppendingString:[NSString stringWithFormat:@"%@ add",des1]];
        }
        NSString *des2 = item.xibPropertyDescription;
        if (des2) {
            des = [des stringByAppendingString:des2];
        }
        if (des.length > 2) {
            des = [@"//" stringByAppendingString:des];
        }
        content = [content stringByAppendingString:[NSString stringWithFormat:@"\n[_%@ addSubview:self.%@]; %@",view.xibPropertyName,item.xibPropertyName,des]];
    }
    
    // 生成约束
    for (UIView *item in view.subviews) {
        content = [content stringByAppendingString:[self getLayoutStringFromView:item]];
    }
    string = [string stringByReplacingOccurrencesOfString:@"$" withString:content];
    self.getInitContent = [self.getInitContent stringByAppendingString:string];
}

// 生成 subView 相关约束
-(NSString *) getLayoutStringFromView:(UIView *)subView{
    if (self.isXibSimple) {
        if (subView.xibPropertyName) {
            return [NSString stringWithFormat:@"(*%@*)",subView.xibPropertyName];
        }
        return @"";
//       return  [self getLayoutStringFromViewXibSimple:subView];
    }
    NSString *content = @"\n";
    for (NSLayoutConstraint *constraint in subView.constraints) {
        NSString *name = [NSString stringWithFormat:@"self.%@",subView.xibPropertyName];
        if (subView == self.backView) {
            name = @"self";
        }
        id secondItem = constraint.secondItem;
        id firstItem = constraint.firstItem;
        NSString *item1 = @"nil";
        NSString *item2 = @"nil";
        NSString *str = @"";
        if ([firstItem isKindOfClass:[UILayoutGuide class]]) {
            if (subView == self.backView) {
                item1 =  [NSString stringWithFormat:@"self"];
            }else{
                item1 =  [NSString stringWithFormat:@"self.%@",((UIView *)firstItem).xibPropertyName];
            }
        }else {
            if (firstItem == self.backView) {
                item1 =  @"self";
            }else{
                item1 =  [NSString stringWithFormat:@"self.%@",((UIView *)firstItem).xibPropertyName];
            }
            
        }
        
        if ([secondItem isKindOfClass:[UILayoutGuide class]]) {
            if (subView == self.backView) {
                item2 =  [NSString stringWithFormat:@"self"];
            }else{
                item2 =  [NSString stringWithFormat:@"self.%@",((UIView *)secondItem).xibPropertyName];
            }
        }else if ([secondItem isKindOfClass:[UIView class]]){
            if (secondItem == self.backView) {
                item2 =  @"self";
            }else{
                item2 =  [NSString stringWithFormat:@"self.%@",((UIView *)secondItem).xibPropertyName];
            }
        }
        if (name ) {
            str = [NSString stringWithFormat:@"\n[%@ addConstraint:[NSLayoutConstraint constraintWithItem:%@ attribute:%@ relatedBy:%@ toItem:%@ attribute:%@ multiplier:%lf constant:%lf]];"
                   ,name
                   ,item1
                   ,[self layoutAttributeTypeToString:constraint.firstAttribute isXibSimple:self.isXibSimple]
                   ,[self layoutRelationTypeToString:constraint.relation isXibSimple:self.isXibSimple]
                   ,item2
                   ,[self layoutAttributeTypeToString:constraint.secondAttribute isXibSimple:self.isXibSimple]
                   ,constraint.multiplier
                   ,constraint.constant];
            if (constraint.firstAttribute == constraint.secondAttribute && [item1 isEqualToString:item2]) {
                str = @"";
            }
        }
        
        content = [content stringByAppendingString:str];
    }
    return content;
}

-(void) getAllXibLayout{
    _xibArray = [NSMutableArray arrayWithCapacity:10];
    for (UIView *view in _allViewS) {
        if (view.constraints.count > 0) {
            [_xibArray addObjectsFromArray:view.constraints];
        }
    }
    [self getLayoutStringFromViewXibSimple];
}


// 生成 subView 相关约束
-(void ) getLayoutStringFromViewXibSimple{
    for (UIView *view in _allViewS) {
        NSString *content = @"\n";
        for (NSLayoutConstraint *constraint in _xibArray) {
            UIView *secondItem;
            UIView *firstItem;
            BOOL flag = false;
            if ([constraint.firstItem isKindOfClass:[UILayoutGuide class]]) {
                firstItem = ((UILayoutGuide *)constraint.firstItem).owningView;
            }else {
                firstItem = constraint.firstItem;
                
            }
            
            if ([constraint.secondItem isKindOfClass:[UILayoutGuide class]]) {
                secondItem = ((UILayoutGuide *)constraint.secondItem).owningView;
            }else {
                secondItem = constraint.secondItem;
                
            }
            if (firstItem == self.backView) {
                if (secondItem == view) {
                    flag = true;
                }
            }else{
                if (firstItem == view) {
                    flag = true;
                }
            }
            
            if (flag) {
                NSString *str;
                NSString *item1 = @"nil";
                NSString *item2 = @"nil";
                if (firstItem == self.backView) {
                    item1 =  @"self";
                }else{
                    item1 =  [NSString stringWithFormat:@"self.%@",((UIView *)firstItem).xibPropertyName];
                }
                
                if (secondItem == self.backView) {
                    item2 =  @"self";
                }else if(secondItem) {
                    item2 =  [NSString stringWithFormat:@"self.%@",((UIView *)secondItem).xibPropertyName];
                }else{
                    item2 = @"nil";
                }
                
                item1 = [NSString stringWithFormat:@"%@.%@" ,item1
                         ,[self layoutAttributeTypeToSimpleString:constraint.firstAttribute isXibSimple:self.isXibSimple]];
                
                if (![item2 isEqualToString:@"nil"]) {
                    item2 = [NSString stringWithFormat:@"%@.%@" ,item2
                            ,[self layoutAttributeTypeToSimpleString:constraint.secondAttribute isXibSimple:self.isXibSimple]];
                }
                
                NSString *pro = @"";
                NSString *multip = @"";
                
                if (constraint.priority == UILayoutPriorityDefaultHigh) {
                    pro = [NSString stringWithFormat:@" priority:UILayoutPriorityDefaultHigh"];
                }
                if (constraint.priority == UILayoutPriorityDefaultLow) {
                    pro = [NSString stringWithFormat:@" priority:UILayoutPriorityDefaultLow"];
                }
                if (constraint.priority == UILayoutPriorityFittingSizeLevel) {
                    pro = [NSString stringWithFormat:@" priority:UILayoutPriorityFittingSizeLevel"];
                }
                
                if (constraint.multiplier != 1.00 || multip.length > 4) {
                    multip = [NSString stringWithFormat:@" multiplier:%.2lf",constraint.multiplier];
                }
                
                
                if (firstItem == self.backView) {
                    str = [NSString stringWithFormat:@"\n[%@ %@:%@ constant:%.2lf%@];"
                           ,item2
                           ,[self layoutRelationTypeToString:constraint.relation isXibSimple:self.isXibSimple]
                           ,item1
                           ,constraint.constant*-1
                           ,multip];
                    
                }else{
                    str = [NSString stringWithFormat:@"\n[%@ %@:%@ constant:%.2lf%@];"
                           ,item1
                           ,[self layoutRelationTypeToString:constraint.relation isXibSimple:self.isXibSimple]
                           ,item2
                           ,constraint.constant
                           ,multip];
                }
                if (constraint.firstAttribute == constraint.secondAttribute && [item1 isEqualToString:item2]) {
                    str = @"";
                }
                content = [content stringByAppendingString:str];
            }
        }
        self.getInitContent = [self.getInitContent stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"(*%@*)",view.xibPropertyName] withString:content];
    }
}

// 生成 subView 相关约束
-(NSString *) getLayoutStringFromViewXibSimple:(UIView *)subView{
    NSString *content = @"\n";
    for (NSLayoutConstraint *constraint in subView.constraints) {
        id secondItem = constraint.secondItem;
        id firstItem = constraint.firstItem;
        NSString *item1 = @"nil";
        NSString *item2 = @"nil";
        NSString *str = @"";
        if ([firstItem isKindOfClass:[UILayoutGuide class]]) {
            if (subView == self.backView) {
                item1 =  [NSString stringWithFormat:@"self"];
            }else{
                item1 =  [NSString stringWithFormat:@"self.%@",((UIView *)firstItem).xibPropertyName];
            }
        }else {
            if (firstItem == self.backView) {
                item1 =  @"self";
            }else{
                item1 =  [NSString stringWithFormat:@"self.%@",((UIView *)firstItem).xibPropertyName];
            }
            
        }
        
        if ([secondItem isKindOfClass:[UILayoutGuide class]]) {
            if (subView == self.backView) {
                item2 =  [NSString stringWithFormat:@"self"];
            }else{
                item2 =  [NSString stringWithFormat:@"self.%@",((UIView *)secondItem).xibPropertyName];
            }
        }else if ([secondItem isKindOfClass:[UIView class]]){
            if (secondItem == self.backView) {
                item2 =  @"self";
            }else{
                item2 =  [NSString stringWithFormat:@"self.%@",((UIView *)secondItem).xibPropertyName];
            }
        }
        NSString *str2 = @"nil";
        if (![item2 isEqualToString:@"nil"]) {
            str2 = [NSString stringWithFormat:@"%@.%@" ,item2
                    ,[self layoutAttributeTypeToString:constraint.secondAttribute isXibSimple:self.isXibSimple]];
        }
        str = [NSString stringWithFormat:@"\n[%@.%@  %@:%@  multiplier:%lf constant:%lf];"
               ,item1
               ,[self layoutAttributeTypeToString:constraint.firstAttribute isXibSimple:self.isXibSimple]
               ,[self layoutRelationTypeToString:constraint.relation isXibSimple:self.isXibSimple]
               ,str2
               ,constraint.multiplier
               ,constraint.constant];
        if (constraint.firstAttribute == constraint.secondAttribute && [item1 isEqualToString:item2]) {
            str = @"";
        }
        
        content = [content stringByAppendingString:str];
    }
    return content;
}
//NSLayoutAttribute 枚举转化为 String 名称
-(NSString *) layoutAttributeTypeToSimpleString:(NSLayoutAttribute)type isXibSimple:(BOOL)isXibSimple{
    switch (type) {
        case NSLayoutAttributeLeft:{  return isXibSimple? @"leftXib":@"NSLayoutAttributeLeft";}break;
        case NSLayoutAttributeRight:{  return isXibSimple? @"rightXib":@"NSLayoutAttributeRight";}break;
        case NSLayoutAttributeTop:{  return isXibSimple? @"topXib":@"NSLayoutAttributeTop";}break;
        case NSLayoutAttributeBottom:{  return isXibSimple? @"bottomXib":@"NSLayoutAttributeBottom";}break;
        case NSLayoutAttributeLeading:{  return isXibSimple? @"leadingXib":@"NSLayoutAttributeLeading";}break;
        case NSLayoutAttributeTrailing:{  return isXibSimple? @"trailingXib":@"NSLayoutAttributeTrailing";}break;
        case NSLayoutAttributeWidth:{  return isXibSimple? @"widthXib":@"NSLayoutAttributeWidth";}break;
        case NSLayoutAttributeHeight:{  return isXibSimple? @"heightXib":@"NSLayoutAttributeHeight";}break;
        case NSLayoutAttributeCenterX:{  return isXibSimple? @"centerXXib":@"NSLayoutAttributeCenterX";}break;
        case NSLayoutAttributeCenterY:{  return isXibSimple? @"centerYXib":@"NSLayoutAttributeCenterY";}break;
        case NSLayoutAttributeLastBaseline:{  return isXibSimple? @"lastBaselineXib":@"NSLayoutAttributeLastBaseline";}break;
        case NSLayoutAttributeFirstBaseline :{  return isXibSimple? @"firstBaselineXib":@"NSLayoutAttributeFirstBaseline";}break;
        case NSLayoutAttributeLeftMargin :{  return isXibSimple? @"leftMarginXib":@"NSLayoutAttributeLeftMargin";}break;
        case NSLayoutAttributeRightMargin :{  return isXibSimple? @"rightMarginXib":@"NSLayoutAttributeRightMargin";}break;
        case NSLayoutAttributeTopMargin :{  return isXibSimple? @"topMarginXib":@"NSLayoutAttributeTopMargin";}break;
        case NSLayoutAttributeBottomMargin :{  return isXibSimple? @"bottomMarginXib":@"NSLayoutAttributeBottomMargin";}break;
        case NSLayoutAttributeLeadingMargin :{  return isXibSimple? @"leadingMarginXib":@"NSLayoutAttributeLeadingMargin";}break;
        case NSLayoutAttributeTrailingMargin :{  return isXibSimple? @"trailingMarginXib":@"NSLayoutAttributeTrailingMargin";}break;
        case NSLayoutAttributeCenterXWithinMargins:{  return isXibSimple? @"centerXWithinMarginsXib":@"NSLayoutAttributeCenterXWithinMargins";}break;
        case NSLayoutAttributeCenterYWithinMargins:{  return isXibSimple? @"Xib":@"NSLayoutAttributeCenterYWithinMargins";}break;
        case NSLayoutAttributeNotAnAttribute:{  return isXibSimple? @"centerYWithinMarginsXib":@"NSLayoutAttributeNotAnAttribute";}break;
    }
    return  @"";
}


//NSLayoutAttribute 枚举转化为 String 名称
-(NSString *) layoutAttributeTypeToString:(NSLayoutAttribute)type isXibSimple:(BOOL)isXibSimple{
    switch (type) {
        case NSLayoutAttributeLeft:{  return isXibSimple? @"xib_left":@"NSLayoutAttributeLeft";}break;
        case NSLayoutAttributeRight:{  return isXibSimple? @"xib_right":@"NSLayoutAttributeRight";}break;
        case NSLayoutAttributeTop:{  return isXibSimple? @"xib_top":@"NSLayoutAttributeTop";}break;
        case NSLayoutAttributeBottom:{  return isXibSimple? @"xib_bottom":@"NSLayoutAttributeBottom";}break;
        case NSLayoutAttributeLeading:{  return isXibSimple? @"xib_leading":@"NSLayoutAttributeLeading";}break;
        case NSLayoutAttributeTrailing:{  return isXibSimple? @"xib_trailing":@"NSLayoutAttributeTrailing";}break;
        case NSLayoutAttributeWidth:{  return isXibSimple? @"xib_width":@"NSLayoutAttributeWidth";}break;
        case NSLayoutAttributeHeight:{  return isXibSimple? @"xib_height":@"NSLayoutAttributeHeight";}break;
        case NSLayoutAttributeCenterX:{  return isXibSimple? @"xib_centerX":@"NSLayoutAttributeCenterX";}break;
        case NSLayoutAttributeCenterY:{  return isXibSimple? @"xib_centerY":@"NSLayoutAttributeCenterY";}break;
        case NSLayoutAttributeLastBaseline:{  return isXibSimple? @"xib_lastBaseline":@"NSLayoutAttributeLastBaseline";}break;
        case NSLayoutAttributeFirstBaseline :{  return isXibSimple? @"xib_firstBaseline":@"NSLayoutAttributeFirstBaseline";}break;
        case NSLayoutAttributeLeftMargin :{  return isXibSimple? @"xib_leftMargin":@"NSLayoutAttributeLeftMargin";}break;
        case NSLayoutAttributeRightMargin :{  return isXibSimple? @"xib_rightMargin":@"NSLayoutAttributeRightMargin";}break;
        case NSLayoutAttributeTopMargin :{  return isXibSimple? @"xib_topMargin":@"NSLayoutAttributeTopMargin";}break;
        case NSLayoutAttributeBottomMargin :{  return isXibSimple? @"xib_bottomMargin":@"NSLayoutAttributeBottomMargin";}break;
        case NSLayoutAttributeLeadingMargin :{  return isXibSimple? @"xib_leadingMargin":@"NSLayoutAttributeLeadingMargin";}break;
        case NSLayoutAttributeTrailingMargin :{  return isXibSimple? @"xib_trailingMargin":@"NSLayoutAttributeTrailingMargin";}break;
        case NSLayoutAttributeCenterXWithinMargins:{  return isXibSimple? @"xib_centerXWithinMargins":@"NSLayoutAttributeCenterXWithinMargins";}break;
        case NSLayoutAttributeCenterYWithinMargins:{  return isXibSimple? @"":@"NSLayoutAttributeCenterYWithinMargins";}break;
        case NSLayoutAttributeNotAnAttribute:{  return isXibSimple? @"xib_centerYWithinMargins":@"NSLayoutAttributeNotAnAttribute";}break;
    }
    return  @"";
}

//NSLayoutRelation 枚举转化为 String 名称
-(NSString *) layoutRelationTypeToString:(NSLayoutRelation )type isXibSimple:(BOOL)isXibSimple{
    switch (type) {
        case NSLayoutRelationLessThanOrEqual:{return isXibSimple? @"lassThan":@"NSLayoutRelationLessThanOrEqual";}break;
        case NSLayoutRelationEqual:{return isXibSimple? @"equalTo":@"NSLayoutRelationEqual";}break;
        case NSLayoutRelationGreaterThanOrEqual:{return isXibSimple? @"greaterThan":@"NSLayoutRelationGreaterThanOrEqual";}break;
        default:
            break;
    }
    return @"";;
}

//写入桌面文件
-(void) writeToFileHString:(NSString *)hString mString:(NSString *)mString{
    ///  路径 如无则自动创建一个
    NSString *hPath = [NSString stringWithFormat:@"//Users/lgy/Desktop/%@.h",self.className];
    NSString *mPath   = [NSString stringWithFormat:@"//Users/lgy/Desktop/%@.m",self.className];
    
    //  添加.h文件
    BOOL isWriteHString =[hString writeToFile:hPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (isWriteHString) {
        NSLog(@"LGYXibToLayoutDefault .h文件写入 成功");
    }else{
        NSLog(@"LGYXibToLayoutDefault .h文件写入 失败");
    };
    
    //  添加.m文件
    BOOL isWriteMString =[mString writeToFile:mPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (isWriteMString) {
        NSLog(@"LGYXibToLayoutDefault .m文件写入 成功");
    }else{
        NSLog(@"LGYXibToLayoutDefault .m文件写入 失败");
    };
}

#pragma mark - get
- (NSMutableArray *)dataScoureViews{
    if (!_dataScoureViews) {
        _dataScoureViews = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataScoureViews;
}

@end



