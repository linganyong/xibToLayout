导入在文件夹 LGYXibToLayout 

#import "LGYXibToLayoutDefault.h"

//根据 View.xib 生产布局代码，
[[LGYXibToLayoutDefault new] getXibFrom:@"View" toClassName:@"ExampleView" isXibSimple:false];

生成的文件路径：
NSString *hPath = [NSString stringWithFormat:@"//Users/lgy/Desktop/%@.h",self.className]; //.h 文件路径
NSString *mPath   = [NSString stringWithFormat:@"//Users/lgy/Desktop/%@.m",self.className]; //.m 文件路径


如果：isXibSimple == false
生成如下 .m文件布局代码 如下：
[self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view1 attribute:NSLayoutAttributeBottom multiplier:1.000000 constant:330.000000]];
[self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view2 attribute:NSLayoutAttributeTrailing multiplier:1.000000 constant:16.000000]];
[self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.headerView attribute:NSLayoutAttributeTrailing multiplier:1.000000 constant:16.000000]];
[self addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.000000 constant:0.000000]];
[self addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.000000 constant:16.000000]];
[self addConstraint:[NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.000000 constant:16.000000]];
[self addConstraint:[NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.secondView attribute:NSLayoutAttributeBottom multiplier:1.000000 constant:20.500000]];


如果：isXibSimple == true
依赖：  #import "UIView+LGYXibToLayout.h"
生成如下 .m文件布局代码 如下： 
[self.xib_bottom  equalTo:self.view1.xib_bottom  multiplier:1.000000 constant:330.000000];
[self.xib_trailing  equalTo:self.view2.xib_trailing  multiplier:1.000000 constant:16.000000];
[self.xib_trailing  equalTo:self.headerView.xib_trailing  multiplier:1.000000 constant:16.000000];
[self.headerView.xib_top  equalTo:self.xib_top  multiplier:1.000000 constant:0.000000];
[self.headerView.xib_leading  equalTo:self.xib_leading  multiplier:1.000000 constant:16.000000];
[self.view1.xib_leading  equalTo:self.xib_leading  multiplier:1.000000 constant:16.000000];
[self.view1.xib_top  equalTo:self.secondView.xib_bottom  multiplier:1.000000 constant:20.500000];
[self.view1.xib_trailing  equalTo:self.xib_trailing  multiplier:1.000000 constant:0.000000];
[self.secondView.xib_top  equalTo:self.headerView.xib_bottom  multiplier:1.000000 constant:33.000000];
[self.secondView.xib_centerX  equalTo:self.headerView.xib_centerX  multiplier:1.000000 constant:0.000000];
[self.view2.xib_top  equalTo:self.view1.xib_bottom  multiplier:1.000000 constant:71.000000];
[self.view2.xib_leading  equalTo:self.xib_leading  multiplier:1.000000 constant:16.000000];
[self.view2.xib_height  equalTo:self.view1_2_1.xib_height  multiplier:1.000000 constant:0.000000];
