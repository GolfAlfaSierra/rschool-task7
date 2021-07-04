//
//  UIButton+BackgoundColor.h
//  ios task 7
//
//  Created by John Kent on 04.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (BackgoundColor)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
