//
//
//代码生成 工具 LGYXibToLayoutDefault  
//
 
#import <UIKit/UIKit.h> 
#import "UIView+LGYXibToLayout.h"  


@interface RegisterView : UIView 
 
@property (nonatomic,strong) UIImageView *backImageView; //
@property (nonatomic,strong) UIButton *backBtn; // 返回按钮 
@property (nonatomic,strong) UILabel *label1; // 请输入 
@property (nonatomic,strong) UILabel *label2; // 电话号码 
@property (nonatomic,strong) UIButton *areaBtn; // 电话区号 
@property (nonatomic,strong) UIView *line1; // 区号下划线 
@property (nonatomic,strong) UITextField *phoneTextField; // 填写电话号码
@property (nonatomic,strong) UIView *lin2; // 电话部分下划线 
@property (nonatomic,strong) UIButton *nextBtn; // 下一步

-(void) xibLayoutView;

 @end
