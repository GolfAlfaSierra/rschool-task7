//
//  UIButton+BackgoundColor.m
//  ios task 7
//
//  Created by John Kent on 04.07.2021.
//

#import "UIButton+BackgoundColor.h"

@implementation UIButton(BackgroundColor)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    [self setBackgroundImage:[self imageWithColor:color] forState:state];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
