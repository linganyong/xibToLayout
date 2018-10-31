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

-(void)equalTo:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;

-(void)lassThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;

-(void)greaterThan:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;

-(void)relatedBy:(NSLayoutRelation)relation  attribute:(XibLayoutAttribute *)attr2  multiplier:(CGFloat)multiplier constant:(CGFloat)c;

@end
