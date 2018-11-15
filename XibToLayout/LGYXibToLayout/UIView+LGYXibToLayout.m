//
//  UIView+LGYXibToLayout.m
//  XibToLayout
//
//  Created by lgy on 2018/10/30.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "UIView+LGYXibToLayout.h"

@implementation UIView (LGYXibToLayout)

//-(NSLayoutConstraint *)xibLayout:(XibLayoutAttribute *)attr1 equalTo:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
//    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:attr1.attributeView attribute:attr1.attribute     relatedBy:NSLayoutRelationEqual toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c];
//     [self addLGYConstraint:layout];
//     return layout;
//};
//
//-(NSLayoutConstraint *)xibLayout:(XibLayoutAttribute *)attr1 lassThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
//    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:attr1.attributeView attribute:attr1.attribute     relatedBy:NSLayoutRelationLessThanOrEqual toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c];
//    [self addConstraint:layout];
//    return layout;
//};
//
//-(NSLayoutConstraint *)xibLayout:(XibLayoutAttribute *)attr1 greaterThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
//    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:attr1.attributeView attribute:attr1.attribute     relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c];
//     [self addLGYConstraint:layout];
//     return layout;
//};
//
//-(NSLayoutConstraint *)xibUpdataLayout:(XibLayoutAttribute *)attr1 equalTo:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
//    return [self addLGYConstraint:[NSLayoutConstraint constraintWithItem:attr1.attributeView attribute:attr1.attribute     relatedBy:NSLayoutRelationEqual toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c]];
//};
//
//-(NSLayoutConstraint *)xibUpdataLayout:(XibLayoutAttribute *)attr1 lassThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
//    return [self addLGYConstraint:[NSLayoutConstraint constraintWithItem:attr1.attributeView attribute:attr1.attribute     relatedBy:NSLayoutRelationLessThanOrEqual toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c]];
//};
//
//-(NSLayoutConstraint *)xibUpdataLayout:(XibLayoutAttribute *)attr1 greaterThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
//    return [self addLGYConstraint:[NSLayoutConstraint constraintWithItem:attr1.attributeView attribute:attr1.attribute     relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c]];
//};
//


- (NSLayoutConstraint *)upDataConstraint:(NSLayoutConstraint *)constraint{
    for (NSLayoutConstraint *item in  self.constraints){
        if (item.firstItem == constraint.firstItem && item.firstAttribute == constraint.firstAttribute && item.secondAttribute == constraint.secondAttribute){
            if (item.secondItem == constraint.secondItem){
                [self removeConstraint:item];
            }
        }
    }
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)getConstraint:(NSString *)xibKey{
    for (NSLayoutConstraint *item in  self.constraints){
        if( [item.xibKey isEqualToString:xibKey]){
            return item;
        };
    }
    return nil;
}

-(XibLayoutAttribute *) addConstraintWithLayoutAttribute:(NSLayoutAttribute)attribute{
    return [[XibLayoutAttribute alloc] initWithAttribute:attribute ForView:self];
}

#pragma mark - standard Attributes
- (XibLayoutAttribute *) xib_left {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeft];
}

- (XibLayoutAttribute *) xib_top {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTop];
}

- (XibLayoutAttribute *) xib_right {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeRight];
}

- (XibLayoutAttribute *) xib_bottom {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBottom];
}

- (XibLayoutAttribute *) xib_leading {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeading];
}

- (XibLayoutAttribute *) xib_trailing {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTrailing];
}

- (XibLayoutAttribute *) xib_width {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeWidth];
}

- (XibLayoutAttribute *) xib_height {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeHeight];
}

- (XibLayoutAttribute *) xib_centerX {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterX];
}

- (XibLayoutAttribute *) xib_centerY {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterY];
}

- (XibLayoutAttribute *) xib_baseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBaseline];
}


- (XibLayoutAttribute *) xib_firstBaseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeFirstBaseline];
}

- (XibLayoutAttribute *) xib_lastBaseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLastBaseline];
}

- (XibLayoutAttribute *) xib_leftMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeftMargin];
}

- (XibLayoutAttribute *) xib_rightMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeRightMargin];
}

- (XibLayoutAttribute *) xib_topMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTopMargin];
}

- (XibLayoutAttribute *) xib_bottomMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBottomMargin];
}

- (XibLayoutAttribute *) xib_leadingMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeadingMargin];
}

- (XibLayoutAttribute *) xib_trailingMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTrailingMargin];
}

- (XibLayoutAttribute *) xib_centerXWithinMargins {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterXWithinMargins];
}

- (XibLayoutAttribute *) xib_centerYWithinMargins {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterYWithinMargins];
}

@end
