//
//  AppColors.m
//  ios task 7
//
//  Created by John Kent on 02.07.2021.
//

#import "AppColors.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation AppColors

+(UIColor *)black {
    return UIColorFromRGB(0x000000);
}

+(UIColor *)blackCoral {
    return UIColorFromRGB(0x4C5C68);

}

+(UIColor *)littleBoyBlue{
    return UIColorFromRGB(0x80A4ED);
}

+(UIColor *)turquosieGreen{
    return UIColorFromRGB(0x91C7B1);
}

+(UIColor *)venetianRed{
    return UIColorFromRGB(0xC20114);
}

+(UIColor *)white {
    return UIColorFromRGB(0xFFFFFF);
}
@end
