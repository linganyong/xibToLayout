//
//  UIView+Default.m
//  XibToLayout
//
//  Created by lgy on 2018/11/14.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "UIView+Default.h"

static const void * propertyNameKey = @"propertyNameKey";
static const void * xibPropertyDescriptionKey = @"xibPropertyDescriptionKey";

@implementation UIView (Default)


-(NSString *) xibPropertyName{
    return objc_getAssociatedObject(self,propertyNameKey);
}

-(void) setXibPropertyName:(NSString *)xibPropertyName{
    objc_setAssociatedObject(self, propertyNameKey, xibPropertyName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *) xibPropertyDescription{
    return objc_getAssociatedObject(self,xibPropertyDescriptionKey);
}

-(void) setXibPropertyDescription:(NSString *)xibPropertyDescription{
    objc_setAssociatedObject(self, xibPropertyDescriptionKey, xibPropertyDescription, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
