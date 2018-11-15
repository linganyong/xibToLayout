//
//  XibLayoutAttribute.m
//  XibToLayout
//
//  Created by lgy on 2018/10/31.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "XibLayoutAttribute.h"
#import "UIView+LGYXibToLayout.h"


@interface XibLayoutAttribute()


@end

@implementation XibLayoutAttribute

{
    NSMutableArray *supViewArray;
//    CGFloat _multiplier;
//    CGFloat _constant;
//    NSInteger _priority;
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

-(NSLayoutConstraint *)equalTo:(XibLayoutAttribute *)attr2  constant:(CGFloat)c {
    return [self relatedBy:NSLayoutRelationEqual attribute:attr2 multiplier:1 constant:c];
};

-(NSLayoutConstraint *)lassThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c {
    return [self relatedBy:NSLayoutRelationLessThanOrEqual attribute:attr2 multiplier:1 constant:c];
};

-(NSLayoutConstraint *)greaterThan:(XibLayoutAttribute *)attr2 constant:(CGFloat)c {
    return [self relatedBy:NSLayoutRelationGreaterThanOrEqual attribute:attr2 multiplier:1 constant:c];
};

-(NSLayoutConstraint *)equalTo:(XibLayoutAttribute *)attr2 constant:(CGFloat)c multiplier:(CGFloat)multiplier{
    return [self relatedBy:NSLayoutRelationEqual attribute:attr2 multiplier:multiplier constant:c];
};

-(NSLayoutConstraint *)lassThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c  multiplier:(CGFloat)multiplier{
    return  [self relatedBy:NSLayoutRelationLessThanOrEqual attribute:attr2 multiplier:multiplier constant:c];
};

-(NSLayoutConstraint *)greaterThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c  multiplier:(CGFloat)multiplier{
    return [self relatedBy:NSLayoutRelationGreaterThanOrEqual attribute:attr2 multiplier:multiplier constant:c];
};

-(NSLayoutConstraint *)equalTo:(XibLayoutAttribute *)attr2 constant:(CGFloat)c multiplier:(CGFloat)multiplier priority:(UILayoutPriority)priority{
    return [self relatedBy:NSLayoutRelationEqual attribute:attr2 multiplier:multiplier constant:c priority:priority isUpdata:false];
};

-(NSLayoutConstraint *)lassThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c  multiplier:(CGFloat)multiplier priority:(UILayoutPriority)priority{
    return [self relatedBy:NSLayoutRelationLessThanOrEqual attribute:attr2 multiplier:multiplier constant:c priority:priority isUpdata:false];
};

-(NSLayoutConstraint *)greaterThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c  multiplier:(CGFloat)multiplier priority:(UILayoutPriority)priority{
    return [self relatedBy:NSLayoutRelationGreaterThanOrEqual attribute:attr2 multiplier:multiplier constant:c priority:priority isUpdata:false];
};


-(NSLayoutConstraint *)relatedBy:(NSLayoutRelation)relation  attribute:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c{
    return [self relatedBy:relation attribute:attr2 multiplier:multiplier constant:c priority:0 isUpdata:false];
}

-(NSLayoutConstraint *)relatedBy:(NSLayoutRelation)relation  attribute:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c priority:(UILayoutPriority)priority isUpdata:(BOOL)upData{
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self.attributeView attribute:self.attribute     relatedBy:relation toItem:attr2.attributeView attribute:attr2.attribute multiplier:multiplier constant:c];
    if (priority != 0) {
        layout.priority = priority;
    }
    if ([self layoutError:attr2]) {
        return layout;
    }
    UIView *view;
    if (attr2 == nil) {
        view = self.attributeView;
    }else if (self.attributeView == attr2.attributeView) {
        view = self.attributeView;
    }else if(self.attributeView == attr2.attributeView.superview){
        view = self.attributeView;
    }else if(self.attributeView.superview == attr2.attributeView.superview){
        view = self.attributeView.superview;
    }else if(self.attributeView.superview == attr2.attributeView){
        view = self.attributeView.superview ;
    }else{
        NSArray *array1 = [self getSuperView:attr2.attributeView];
        supViewArray = nil;
        NSArray *array2 = [self getSuperView:self.attributeView];
        for (UIView *view1 in array1) {
            for (UIView *view2 in array2) {
                if (view1 == view2) {
                    view = view1;
                    break;
                }
            }
        }
        if (view.constraints.count < 1) {
            view.translatesAutoresizingMaskIntoConstraints = NO;
        }
    }
    if (self.attributeView.constraints.count < 1) {
        self.attributeView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if (attr2.attributeView.constraints.count < 1) {
        attr2.attributeView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    if (upData) {
        [view upDataConstraint:layout];
    }else{
        [view addConstraint:layout];
    }
    return layout;
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
