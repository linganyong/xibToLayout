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



如果：isXibSimple == true
生成如下 .m文件布局代码 如下： 
[self.xib_bottom  equalTo:self.view1.xib_bottom  multiplier:1.000000 constant:330.000000]; // 依赖：  #import "UIView+LGYXibToLayout.h"

