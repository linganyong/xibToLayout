//
//  XibLayoutAttribute.m
//  XibToLayout
//
//  Created by lgy on 2018/10/31.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "XibLayoutAttribute.h"
#import "UIView+LGYXibToLayout.h"

@implementation XibLayoutAttribute
{
    NSMutableArray *supViewArray;
}


-(id) initWithAttribute:(NSLayoutAttribute )attribute ForView:(UIView *)view{
    if (self = [super init]) {
        self.attribute = attribute;
        self.attributeView = view;
    }
    return self;
}


-(BOOL) layoutError:(XibLayoutAttribute *)attr2{
    if (!self.attributeView) {
        NSLog(@"XibLayoutAttributeERROR %@ 视图不存在，无法布局！",self);
        return true;
    }
    if (attr2 && !attr2.attributeView) {
        NSLog(@"XibLayoutAttributeERROR %@ 视图不存在，无法布局！",attr2);
        return true;
    }
    return false;
}

-(void)equalTo:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
    [self relatedBy:NSLayoutRelationEqual attribute:attr2 multiplier:multiplier constant:c];
};


-(void)lassThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
    [self relatedBy:NSLayoutRelationLessThanOrEqual attribute:attr2 multiplier:multiplier constant:c];
};

-(void)greaterThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
    [self relatedBy:NSLayoutRelationGreaterThanOrEqual attribute:attr2 multiplier:multiplier constant:c];
};

-(void)relatedBy:(NSLayoutRelation)relation  attribute:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
    if ([self layoutError:attr2]) {
        return;
    }
    if (attr2 == nil) {
        [self.attributeView addConstraint:[NSLayoutConstraint constraintWithItem:self.attributeView attribute:self.attribute     relatedBy:relation toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:multiplier constant:c]];
    }else if (self.attributeView == attr2.attributeView) {
        [self.attributeView addConstraint:[NSLayoutConstraint constraintWithItem:self.attributeView attribute:self.attribute     relatedBy:relation toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c]];
    }else if(self.attributeView == attr2.attributeView.superview){
        [self.attributeView addConstraint:[NSLayoutConstraint constraintWithItem:self.attributeView attribute:self.attribute     relatedBy:relation toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c]];
    }else if(self.attributeView.superview == attr2.attributeView.superview){
        [self.attributeView.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.attributeView attribute:self.attribute     relatedBy:relation toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c]];
    }else if(self.attributeView.superview == attr2.attributeView){
        [self.attributeView.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.attributeView attribute:self.attribute     relatedBy:relation toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c]];
    }else{
        NSArray *array1 = [self getSuperView:attr2.attributeView];
        supViewArray = nil;
        NSArray *array2 = [self getSuperView:self.attributeView];
        for (UIView *view1 in array1) {
            for (UIView *view2 in array2) {
                if (view1 == view2) {
                    [view2 addConstraint:[NSLayoutConstraint constraintWithItem:self.attributeView attribute:self.attribute     relatedBy:relation toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c]];
                    break;
                }
            }
        }
        
    }
}

-(NSArray *) getSuperView:(UIView *)view{
    if (!supViewArray) {
        supViewArray = [NSMutableArray arrayWithCapacity:10];
    }
    if (view.superview) {
        [supViewArray addObject:view.superview];
        [self getSuperView:view.superview];
    }
    return supViewArray;
}

@end
