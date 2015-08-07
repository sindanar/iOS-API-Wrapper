//
//  MessageCenter.m
//  Auto
//
//  Created by Alko on 6/1/13.
//  Copyright (c) 2013 company. All rights reserved.
//

#import "MessageCenter.h"

//#import "UIAlertView+BlocksKit.h"

#import <isFull.h>

#define MC_dispatch_main_sync_safe(block)\
if ([NSThread isMainThread])\
{\
block();\
}\
else\
{\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define MC_SHOW_REAL_ERRORS_TO_USERS    1

@implementation MessageCenter

+ (void)showMessage:(NSString*)message
{
    if ([message isFull]) {
        [self showAlertViewWithTitle:nil andMessage:message];
    }
}

+ (void)showError:(NSError*)error
{
    [self showErrorIfExist:error otherwisePerform:nil];
}

+ (void)showErrorIfExist:(NSError*)error otherwisePerform:(void (^)(void))block
{
    [self showErrorIfExist:error error:nil otherwisePerform:block];
}

+ (void)showErrorIfExist:(NSError*)error error:(void (^)(void))errorBlock otherwisePerform:(void (^)(void))block
{
    if (error) {
        MC_dispatch_main_sync_safe(^{
            #if MC_SHOW_REAL_ERRORS_TO_USERS
                [self showRealErrorAlertView:error];
            #else
                if ([self shouldShowRealErrorToUser:error])
                    [self showRealErrorAlertView:error];
                else
                    [MessageCenter showHostNotReachableError];
            #endif
        });
        if (errorBlock) {
            errorBlock();
        }
    } else if (block) {
        block();
    }
}

+ (void)showRealErrorAlertView:(NSError*)error
{
    if (error) {
        NSString *message = [self messageForError:error];

        if (message) {
            [self showAlertViewWithTitle:nil andMessage:message];
        }
    }
}

+ (NSString *)messageForError:(NSError *)error
{
    NSString *message = nil;
    NSDictionary *userInfo = error.userInfo;

    NSData *data = userInfo[@"com.alamofire.serialization.response.error.data"];

    NSError *parsingError = nil;
    NSDictionary *errorJson = [NSJSONSerialization JSONObjectWithData:data
                                                              options:kNilOptions
                                                                error:&parsingError];
    message = errorJson[@"message"];

    return message;
}

/**
 *  Determines whether app should show real error message to user or just user friendly error message
 *
 *  @param error Error to analyze
 *
 *  @return YES if app should show real error message
 */
+ (BOOL)shouldShowRealErrorToUser:(NSError*)error
{
    BOOL shouldShow = NO;
    NSString *domain = error.domain;
    if ([domain isFull]) {
        shouldShow = [domain isEqualToString:@"com.company.some_real_error"];
    }
        
    return shouldShow;
}

/**
 *  Shows user friendly error message about some problems
 */
+ (void)showHostNotReachableError
{
    [self showAlertViewWithTitle:NSLocalizedString(@"error.title", nil)
                      andMessage:NSLocalizedString(@"error.host.not.reachable", nil)];
}

+ (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"common.ok", nil)
                                          otherButtonTitles:nil];
    [alert show];
}

@end
