//
//  MessageCenter.h
//  Auto
//
//  Created by Alko on 6/1/13.
//  Copyright (c) 2013 company. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+SingletoneObject.h"

@class BaseModel;

@interface MessageCenter : NSObject

/**
 *  Shows message view to user
 *
 *  @param message Message text
 */
+ (void)showMessage:(NSString*)message;

/**
 *  Shows error message to user if 'error' exist
 *  Calls +showErrorIfExist:error:otherwisePerform: internally
 *
 *  @param error Error object for generating a message
 */
+ (void)showError:(NSError*)error;

/**
 *  Shows error message to user if 'error' exist, otherwise invoke 'block'
 *  Calls +showErrorIfExist:error:otherwisePerform: internally
 *
 *  @param error Error object for generating a message
 *  @param block Handler if error is nil
 */
+ (void)showErrorIfExist:(NSError*)error otherwisePerform:(void (^)(void))block;

/**
 *  Shows error message to user if 'error' exist and invoke 'errorBlock', otherwise invoke 'block'
 *
 *  @param error      Error object for generating a message
 *  @param errorBlock Handler if error is exist
 *  @param block      Handler if error is nil
 */
+ (void)showErrorIfExist:(NSError*)error error:(void (^)(void))errorBlock otherwisePerform:(void (^)(void))block;

@end
