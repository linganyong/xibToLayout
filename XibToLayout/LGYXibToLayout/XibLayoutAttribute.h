//
//  XibLayoutAttribute.h
//  XibToLayout
//
//  Created by lgy on 2018/10/31.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XibLayoutAttribute : NSObject

@property (nonatomic,assign) NSLayoutAttribute attribute;
@property (nonatomic,strong) UIView *attributeView;

-(id) initWithAttribute:(NSLayoutAttribute )attribute ForView:(UIView *)view;

-(NSLayoutConstraint *)equalTo:(XibLayoutAttribute *)attr2  constant:(CGFloat)c ;

-(NSLayoutConstraint *)lassThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c ;

-(NSLayoutConstraint *)greaterThan:(XibLayoutAttribute *)attr2 constant:(CGFloat)c ;


-(NSLayoutConstraint *)equalTo:(XibLayoutAttribute *)attr2 constant:(CGFloat)c multiplier:(CGFloat)multiplier;

-(NSLayoutConstraint *)lassThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c  multiplier:(CGFloat)multiplier;

-(NSLayoutConstraint *)greaterThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c  multiplier:(CGFloat)multiplier;

-(NSLayoutConstraint *)equalTo:(XibLayoutAttribute *)attr2 constant:(CGFloat)c multiplier:(CGFloat)multiplier priority:(UILayoutPriority)priority;

-(NSLayoutConstraint *)lassThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c  multiplier:(CGFloat)multiplier priority:(UILayoutPriority)priority;

-(NSLayoutConstraint *)greaterThan:(XibLayoutAttribute *)attr2  constant:(CGFloat)c  multiplier:(CGFloat)multiplier priority:(UILayoutPriority)priority;


-(NSLayoutConstraint *)relatedBy:(NSLayoutRelation)relation  attribute:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;

@end
