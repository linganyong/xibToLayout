//
//  NSLayoutConstraint+LGYXibToLayout.h
//  XibToLayout
//
//  Created by lgy on 2018/11/14.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface NSLayoutConstraint (LGYXibToLayout)

//属性名称
@property (nonatomic,copy)  NSString *xibKey;

@end
