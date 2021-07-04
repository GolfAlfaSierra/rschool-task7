//
//  AuthorizationModel.m
//  ios task 7
//
//  Created by John Kent on 02.07.2021.
//

#import "AuthorizationModel.h"

NSString *secretCode = @"132";

@implementation AuthorizationModel
+(AuthorizationMessages*)authorizeWithLogin:(NSString *)login andPassword:(NSString *)password{
    NSMutableArray<NSNumber* > *result = [NSMutableArray arrayWithArray:@[]];
    
    if (![login isEqualToString:@"login"]) {
        [result addObject:[NSNumber numberWithLong:AppAuthorizationStatusLogin]];
    }
    
    if (![password isEqualToString:@"password"]) {
        [result addObject:[NSNumber numberWithLong:AppAuthorizationStatusPassword]];
    }
    
    if (result.count == 0) {
        [result addObject:[NSNumber numberWithLong:AppAuthorizationStatusOk]];
    }
    
    return result;
}

+ (BOOL)checkPinCode:(NSString *)code{
    NSString *nums = [code stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if ([nums isEqualToString:secretCode]) {
        return YES;
    }
    
    return NO;
}
@end
