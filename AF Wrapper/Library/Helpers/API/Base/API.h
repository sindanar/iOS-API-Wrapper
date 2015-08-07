//
//  API.h
//
//  Created by алко on 1/13/13.
//  Copyright (c) 2013 company. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AWSettings.h"

@class AWModelClass;

@interface API : NSObject

 // Additional data saved in request object
@property (strong, nonatomic) NSDictionary *userInfo;

// Api object to generate request
@property (strong, nonatomic) AWModelClass *object;

// Last API reply
@property (strong, nonatomic) id lastReply;

// Last API error
@property (strong, nonatomic) NSError *lastError;

@end

@interface API (Creating)

/**
 *  Creates api instance
 *
 *  @return Blank API object
 */
+ (instancetype)api;

/**
 *  Creates api instance
 *
 *  @param object Object for generating request
 *
 *  @return API object
 */
+ (instancetype)withObject:(id)object;

/**
 *  Creates api instance and send request
 *
 *  @param completion A block that invokes after request is finished
 *
 *  @return API object
 */
+ (instancetype)withCompletion:(void (^)(id reply, NSError *error, BOOL *handleError))completion;

/**
 *  Creates api instance and send request
 *
 *  @param object Object for generating a request
 *  @param completion A block that invokes after request is finished
 *
 *  @return API object
 */
+ (instancetype)withObject:(id)object
                completion:(void (^)(id reply, NSError *error, BOOL *handleError))completion;

@end

@interface API (RequestProgress)

/**
 *  Sends api request with completion
 *
 *  @param completion A block that invokes after request is finished
 */
- (void)sendRequestWithCompletion:(void (^)(id reply, NSError *error, BOOL *handleError))completion;

/**
 *  Returns YES if API request is already sent and not complete
 *
 *  @return YES if request in progress
 */
- (BOOL)apiRequestInProgress;

/**
 *  Cancels request
 */
- (void)cancel;

@end
