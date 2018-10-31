//
//  UIView+LGYXibToLayout.h
//  XibToLayout
//
//  Created by lgy on 2018/10/30.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "XibLayoutAttribute.h"

@interface UIView (LGYXibToLayout)

//属性名称
@property (nonatomic,copy) IBInspectable NSString *xibPropertyName;
//属性表述
@property (nonatomic,copy) IBInspectable NSString *xibPropertyDescription;

-(void)xibLayout:(XibLayoutAttribute *)attr1 equalTo:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;

-(void)xibLayout:(XibLayoutAttribute *)attr1 lassThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;

-(void)xibLayout:(XibLayoutAttribute *)attr1 greaterThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;

- (XibLayoutAttribute *) xib_left;

- (XibLayoutAttribute *) xib_top;

- (XibLayoutAttribute *) xib_right;

- (XibLayoutAttribute *) xib_bottom;

- (XibLayoutAttribute *) xib_leading;

- (XibLayoutAttribute *) xib_trailing;

- (XibLayoutAttribute *) xib_width;

- (XibLayoutAttribute *) xib_height;

- (XibLayoutAttribute *) xib_centerX;

- (XibLayoutAttribute *) xib_centerY;

- (XibLayoutAttribute *) xib_baseline;

- (XibLayoutAttribute *) xib_firstBaseline;

- (XibLayoutAttribute *) xib_lastBaseline;

- (XibLayoutAttribute *) xib_leftMargin;

- (XibLayoutAttribute *) xib_rightMargin;

- (XibLayoutAttribute *) xib_topMargin ;

- (XibLayoutAttribute *) xib_bottomMargin;

- (XibLayoutAttribute *) xib_leadingMargin;

- (XibLayoutAttribute *) xib_trailingMargin;

- (XibLayoutAttribute *) xib_centerXWithinMargins;

- (XibLayoutAttribute *) xib_centerYWithinMargins;

@end
