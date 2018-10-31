//
//  LGYXibToLayoutDefault.h
//  XibToLayout
//
//  Created by lgy on 2018/10/30.
//  Copyright © 2018年 lgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+LGYXibToLayout.h"

@interface LGYXibToLayoutDefault : NSObject

@property (nonatomic,strong) NSMutableArray *dataScoureViews;

@property (nonatomic,strong) NSString *getInitContent;
@property (nonatomic,strong) NSString *proertyContent;
@property (nonatomic,assign,readonly) BOOL isXibSimple;


-(UIView *) getXibFrom:(NSString *)xibName toClassName:(NSString *)className isXibSimple:(BOOL)isXibSimple;

@end
