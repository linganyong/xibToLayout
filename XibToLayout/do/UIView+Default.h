//
//  UIView+Default.h
//  XibToLayout
//
//  Created by lgy on 2018/11/14.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIView (Default)

//属性名称
@property (nonatomic,copy) IBInspectable NSString *xibPropertyName;
//属性表述
@property (nonatomic,copy) IBInspectable NSString *xibPropertyDescription;

@end
