//
//  LoginView.h
//  ios task 7
//
//  Created by John Kent on 02.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView
@property (weak, nonatomic) IBOutlet UILabel *passCodeLB;
-(void)resetState;

@end

NS_ASSUME_NONNULL_END
