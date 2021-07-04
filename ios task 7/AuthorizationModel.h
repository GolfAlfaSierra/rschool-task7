//
//  AuthorizationModel.h
//  ios task 7
//
//  Created by John Kent on 02.07.2021.
//

#import <Foundation/Foundation.h>



typedef NSArray AuthorizationMessages;

typedef NS_ENUM(NSInteger, AppAuthorizationMessage) {
    AppAuthorizationStatusLogin,
    AppAuthorizationStatusPassword,
    AppAuthorizationStatusOk
};


@interface AuthorizationModel : NSObject

+(AuthorizationMessages*)authorizeWithLogin:(NSString*)login andPassword:(NSString*)password;
+(BOOL)checkPinCode:(NSString*)code;

@end


