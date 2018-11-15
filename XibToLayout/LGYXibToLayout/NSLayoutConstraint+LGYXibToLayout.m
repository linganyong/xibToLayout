//
//  NSLayoutConstraint+LGYXibToLayout.m
//  XibToLayout
//
//  Created by lgy on 2018/11/14.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import "NSLayoutConstraint+LGYXibToLayout.h"

static const void * xibKeyKey = @"xibKey";

@implementation NSLayoutConstraint (LGYXibToLayout)

-(NSString *) xibKey{
    return objc_getAssociatedObject(self,xibKeyKey);
}

-(void) setXibKey:(NSString *)xibKey{
    objc_setAssociatedObject(self, xibKeyKey, xibKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
