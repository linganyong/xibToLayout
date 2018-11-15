//
//  UIView+LGYXibToLayout.h
//  XibToLayout
//
//  Created by lgy on 2018/10/30.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XibLayoutAttribute.h"
#import "NSLayoutConstraint+LGYXibToLayout.h"

@interface UIView (LGYXibToLayout)

//-(NSLayoutConstraint *)xibLayout:(XibLayoutAttribute *)attr1 equalTo:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;
//
//-(NSLayoutConstraint *)xibLayout:(XibLayoutAttribute *)attr1 lassThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;
//
//-(NSLayoutConstraint *)xibLayout:(XibLayoutAttribute *)attr1 greaterThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;
//

//添加约束之前会移除之前的约束
- (NSLayoutConstraint *)upDataConstraint:(NSLayoutConstraint *)constraint;

- (NSLayoutConstraint *)getConstraint:(NSString *)xibKey;

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

- (XibLayoutAttribute *) leftXib;

- (XibLayoutAttribute *) topXib;

- (XibLayoutAttribute *) rightXib;

- (XibLayoutAttribute *) bottomXib;

- (XibLayoutAttribute *) leadingXib;

- (XibLayoutAttribute *) trailingXib;

- (XibLayoutAttribute *) widthXib;

- (XibLayoutAttribute *) heightXib;

- (XibLayoutAttribute *) centerXXib;

- (XibLayoutAttribute *) centerYXib;

- (XibLayoutAttribute *) baselineXib;

- (XibLayoutAttribute *) firstBaselineXib;

- (XibLayoutAttribute *) lastBaselineXib;

- (XibLayoutAttribute *) leftMarginXib;

- (XibLayoutAttribute *) rightMarginXib;

- (XibLayoutAttribute *) topMarginXib;

- (XibLayoutAttribute *) bottomMarginXib;

- (XibLayoutAttribute *) leadingMarginXib;

- (XibLayoutAttribute *) trailingMarginXib;

- (XibLayoutAttribute *) centerXWithinMarginsXib;

- (XibLayoutAttribute *) centerYWithinMarginsXib;

@end
