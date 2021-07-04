//
//  LoginView.m
//  ios task 7
//
//  Created by John Kent on 02.07.2021.
//
#import <QuartzCore/QuartzCore.h>

#import "LoginView.h"
#import "AppColors.h"
#import "UIButton+BackgoundColor.h"

#import "AuthorizationModel.h"

@interface LoginView () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
- (IBAction)authorize:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *authorizeBT;


@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;


@end

@implementation LoginView



- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

-(void)setup{
    self.loginTF.delegate = self;
    self.passwordTF.delegate = self;
    
    [self setupLoginField];
    [self setupAuthorization];
    [self setupPassCode];
    
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
-(void)setupLoginField{
    double borderWidth = 1.5;
    double corenerRadius = 5.0;
    CGColorRef borderColor = AppColors.blackCoral.CGColor;
    
    
    
    [self.loginTF.layer setBorderWidth:borderWidth];
    [self.loginTF.layer setCornerRadius:corenerRadius];
    [self.loginTF.layer setBorderColor:borderColor];
    
    
    [self.passwordTF.layer setBorderWidth:borderWidth];
    [self.passwordTF.layer setCornerRadius:corenerRadius];
    [self.passwordTF.layer setBorderColor:borderColor];
    
    UIView *padding = [[UIView alloc]
                       initWithFrame:CGRectMake(0, 0, 10, self.loginTF.frame.size.height)];
    
    [self.loginTF setLeftView:padding];
    [self.loginTF setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *padding2 = [[UIView alloc]
                        initWithFrame:CGRectMake(0, 0, 10, self.loginTF.frame.size.height)];
    [self.passwordTF setLeftView:padding2];
    [self.passwordTF setLeftViewMode:UITextFieldViewModeAlways];
}

-(void)setupPassCode{
    
    double borderWidth = 1.5;
    double corenerRadius = 25.0;
    CGColorRef borderColor = AppColors.littleBoyBlue.CGColor;
    
    [self.one.superview setHidden:YES];
    
    
    [self.one.layer setBorderWidth:borderWidth];
    [self.one.layer setCornerRadius:corenerRadius];
    [self.one.layer setBorderColor:borderColor];
    [self.one setClipsToBounds:YES];
    
    [self.two.layer setBorderWidth:borderWidth];
    [self.two.layer setCornerRadius:corenerRadius];
    [self.two.layer setBorderColor:borderColor];
    [self.two setClipsToBounds:YES];
    
    [self.three.layer setBorderWidth:borderWidth];
    [self.three.layer setCornerRadius:corenerRadius];
    [self.three.layer setBorderColor:borderColor];
    [self.three setClipsToBounds:YES];
    
    
    CGFloat btnHighlightAlpha = 0.2;
    
    [self.one setBackgroundColor:[AppColors.littleBoyBlue colorWithAlphaComponent:btnHighlightAlpha] forState:UIControlStateHighlighted];
    [self.two setBackgroundColor:[AppColors.littleBoyBlue colorWithAlphaComponent:btnHighlightAlpha] forState:UIControlStateHighlighted];
    [self.three setBackgroundColor:[AppColors.littleBoyBlue colorWithAlphaComponent:btnHighlightAlpha] forState:UIControlStateHighlighted];
    
    
    [self.one addTarget:self action:@selector(aOne) forControlEvents:UIControlEventTouchUpInside];
    [self.two addTarget:self action:@selector(aTwo) forControlEvents:UIControlEventTouchUpInside];
    [self.three addTarget:self action:@selector(aThree) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

-(void)aOne{
    if ([self.passCodeLB.text length] ==  1) {
        [self.passCodeLB setText:@"1 "];
        [self.passCodeLB.superview.layer setBorderColor:[UIColor whiteColor].CGColor];
    } else {
        
        [self.passCodeLB setText:[self.passCodeLB.text stringByAppendingString:@"1 "]];
    }
    
}

-(void)aTwo{
    if ([self.passCodeLB.text length] ==  1) {
        [self.passCodeLB setText:@"2 "];
        [self.passCodeLB.superview.layer setBorderColor:[UIColor whiteColor].CGColor];
    } else {
        [self.passCodeLB setText:[self.passCodeLB.text stringByAppendingString:@"2 "]];
    }
    
}

-(void)aThree{
    if ([self.passCodeLB.text length] ==  1) {
        [self.passCodeLB setText:@"3 "];
        [self.passCodeLB.superview.layer setBorderColor:[UIColor whiteColor].CGColor];
    } else {
        
        [self.passCodeLB setText:[self.passCodeLB.text stringByAppendingString:@"3 "]];
    }
    
}




-(void)setupAuthorization{
    
    [self.authorizeBT.layer setBorderWidth:2];
    [self.authorizeBT.layer setCornerRadius:10];
    [self.authorizeBT.layer setBorderColor:AppColors.littleBoyBlue.CGColor];
    
    [self.authorizeBT setBackgroundColor:[AppColors.littleBoyBlue colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    [self.authorizeBT setTitleColor:[AppColors.littleBoyBlue colorWithAlphaComponent:0.4] forState:UIControlStateHighlighted];
    [self.authorizeBT setImage:[UIImage imageNamed:@"person-fill"] forState:UIControlStateHighlighted];
}




- (IBAction)authorize:(UIButton *)sender {
    
    CGColorRef errorColor = AppColors.venetianRed.CGColor;
    CGColorRef okColor = AppColors.turquosieGreen.CGColor;
    
    NSString *login = [[self loginTF] text];
    NSString *password = [[self passwordTF] text];
    
    NSArray *messages = [AuthorizationModel authorizeWithLogin:login andPassword:password];
    
    if ([messages containsObject:[NSNumber numberWithLong:AppAuthorizationStatusOk]]) {
        [self.loginTF.layer setBorderColor:okColor];
        [self.passwordTF.layer setBorderColor:okColor];
        
        
        CGFloat alphaLevel = 0.5;
        [self.loginTF setAlpha:alphaLevel];
        [self.passwordTF setAlpha:alphaLevel];
        [self.authorizeBT setAlpha:alphaLevel];
        
        [self.loginTF setUserInteractionEnabled:NO];
        [self.passwordTF setUserInteractionEnabled:NO];
        [self.authorizeBT setUserInteractionEnabled:NO];
        
        [self.one.superview setHidden:NO];
    }
    
    
    
    if ([messages containsObject:[NSNumber numberWithLong:AppAuthorizationStatusLogin]]) {
        [self.loginTF.layer setBorderColor:errorColor];
    }
    
    if ([messages containsObject:[NSNumber numberWithLong:AppAuthorizationStatusPassword]]) {
        [self.passwordTF.layer setBorderColor:errorColor];
    }
    
    
    
    
    
    
}

-(void)resetState{
    
    [self.loginTF setUserInteractionEnabled:YES];
    [self.loginTF setText:@""];
    [self.loginTF.layer setBorderColor:AppColors.blackCoral.CGColor];
    [self.loginTF setAlpha:1];
    
    [self.passwordTF setUserInteractionEnabled:YES];
    [self.passwordTF.layer setBorderColor:AppColors.blackCoral.CGColor];
    [self.passwordTF setAlpha:1];
    [self.passwordTF setText:@""];
    
    [self.authorizeBT setUserInteractionEnabled:YES];
    [self.authorizeBT setAlpha:1];
    
    
    
    [self.passCodeLB.superview setHidden:YES];
    [self.passCodeLB setText:@"_"];
    [self.passCodeLB.superview.layer setBorderColor:AppColors.white.CGColor];
    
    [self endEditing:YES];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [textField.layer setBorderColor:AppColors.blackCoral.CGColor];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [textField setText:@""];
    [textField.layer setBorderColor:AppColors.blackCoral.CGColor];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSInteger nextTag = textField.tag + 1;
    
    UIView *nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    
    
    return YES;
}


@end
