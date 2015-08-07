//
//  API_Private.h
//  Auto
//
//  Created by Alko on 3/4/13.
//  Copyright (c) 2013 company. All rights reserved.
//

#import "API.h"

#import "AWMissedProperties.h"
#import "AWModel.h"

#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import <isFull.h>

#define AWAssertShouldOverride                      NSAssert(NO, @"Subclasses should override this method")
#define AWAssertShouldOverrideReturnNil             AWAssertShouldOverride;\
                                                    return nil

@interface API ()

@property (strong, nonatomic) void (^completion)(id reply, NSError *error, BOOL *handleError);
@property (weak, nonatomic) NSURLSessionDataTask *sessionTask;

// Should be setted to YES for logging request and reply data.
@property (nonatomic) BOOL shouldLogRequest;

// Should be setted to NO for prevent access_token appending.
@property (nonatomic) BOOL shouldAddAccessToken;

/**
 *  Returns current HTTP client
 *
 *  @return @return HTTP client
 */
+ (AFHTTPSessionManager *)httpClient;

/**
 *  Returns relative path for api request 
 *  E.g. "search/repositories"
 *
 *  @return API path
 */
- (NSString *)path;

/**
 *  Returns parameters for request that will be appended to request
 *
 *  @return Request parameters
 */
- (NSMutableDictionary *)parameters;

/**
 *  Returns http method for API
 *
 *  @return Http method
 */
- (NSString *)method;

/**
 *  Sets initial values to API object
 */
- (void)prepare;

/**
 *  Determines whether phone is connected to internet
 *
 *  @return YES if internet is reachable
 */
+ (BOOL)networkIsReachable;

/**
 *  Starts failing with network not reachable error sequence
 */
- (void)invokeApiNotReachableSequence;

@end

@interface API (Creating_Private)

/**
 *  Creates URL request for all API requests
 *  Calls prepareURLRequest: internally
 *
 *  @param method     Rest method
 *  @param path       API path
 *  @param parameters Parameters to send
 *
 *  @return Fully prepaired URL request
 */
- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters;

/**
 *  Sets all settings to URL request
 *
 *  @param request Request to set settings
 */
- (void)prepareURLRequest:(NSMutableURLRequest *)request;

@end

@interface API (ReplyHandling)

/**
 *  Called after successfull request
 *
 *  @param reply  Parsed on previous step reply
 *  @param source Raw reply
 */
- (void)apiDidReturnReply:(id)reply source:(id)source;

/**
 *  Called after failed request
 *
 *  @param error Error with fail description
 */
- (void)apiDidFailWithError:(NSError *)error;

/**
 *  Called at end of each request
 */
- (void)apiDidEnd;

/**
 *  Transforms error received from low level libraries to high level API errors
 *  Errors should looks like errors received from our back-end
 *
 *  @param networkError Error from low level libraries
 *
 *  @return Errors that API waits
 */
- (NSError *)apiErrorFromNetworkError:(NSError *)networkError;

@end

@interface API (RequestProgress_Protected)

/**
 *  Returns a class that should parse reply
 *
 *  @return Class for parsing reply
 */
- (Class)classForParsingReply;

@end
