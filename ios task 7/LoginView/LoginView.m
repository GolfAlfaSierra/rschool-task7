//
//  LoginView.m
//  ios task 7
//
//  Created by John Kent on 02.07.2021.
//
#import <QuartzCore/QuartzCore.h>

#import "LoginView.h"
#import "AppColors.h"


@interface LoginView ()
@property (weak, nonatomic) IBOutlet UITextField *loginTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
- (IBAction)authorize:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *authorizeBT;

@end

@implementation LoginView



- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
    
    
    
}

-(void)setup{

    [self.loginTF.layer setValue:[NSNumber numberWithDouble:1.5]  forKey:@"borderWidth"];
    [self.loginTF.layer setValue:[NSNumber numberWithDouble:5.0]  forKey:@"cornerRadius"];
    [self.loginTF.layer setValue:(id)AppColors.blackCoral.CGColor  forKey:@"borderColor"];
    
    
    [self.passwordTF.layer setValue:[NSNumber numberWithDouble:1.5]  forKey:@"borderWidth"];
    [self.passwordTF.layer setValue:[NSNumber numberWithDouble:5.0]  forKey:@"cornerRadius"];
    [self.passwordTF.layer setValue:(id)AppColors.blackCoral.CGColor  forKey:@"borderColor"];
 
    UIView *padding = [[UIView alloc]
                       initWithFrame:CGRectMake(0, 0, 10, self.loginTF.frame.size.height)];
    
    [self.loginTF setValue:padding forKey:@"leftView"];
    [self.loginTF setValue:[NSNumber numberWithInt:UITextFieldViewModeAlways] forKey:@"leftViewMode"];

    UIView *padding2 = [[UIView alloc]
                       initWithFrame:CGRectMake(0, 0, 10, self.loginTF.frame.size.height)];
    [self.passwordTF setValue:padding2 forKey:@"leftView"];
    [self.passwordTF setValue:[NSNumber numberWithInt:UITextFieldViewModeAlways] forKey:@"leftViewMode"];
    
    
    
    [self.authorizeBT.layer setValue:[NSNumber numberWithDouble:2] forKey:@"borderWidth"];
    [self.authorizeBT.layer setValue:[NSNumber numberWithDouble:10] forKey:@"cornerRadius"];
    [self.authorizeBT.layer setValue:(id)AppColors.littleBoyBlue.CGColor forKey:@"borderColor"];
    
    
}
- (IBAction)authorize:(UIButton *)sender {
}
@end
