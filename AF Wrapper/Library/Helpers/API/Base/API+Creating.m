//
//  API+Creating.m
//  Sample
//
//  Created by Alexander Kozin on 04.07.15.
//  Copyright © 2015 Siberian.pro. All rights reserved.
//

#import "API_Private.h"

@implementation API (Creating)

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self prepare];
    }
    return self;
}

+ (instancetype)api
{
    id api = [self new];
    return api;
}

+ (instancetype)withObject:(id)object
{
    id api = [self api];
    [api setObject:object];

    return api;
}

+ (instancetype)withCompletion:(void (^)(id reply, NSError *error, BOOL *handleError))completion
{
    id api = [self api];
    [api sendRequestWithCompletion:completion];

    return api;
}

+ (instancetype)withObject:(id)object completion:(void (^)(id reply, NSError *error, BOOL *handleError))completion
{
    id api = [self withObject:object];
    [api sendRequestWithCompletion:completion];

    return api;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request;

    AFHTTPSessionManager *httpClient = [API httpClient];
    AFHTTPRequestSerializer *serializer = [httpClient requestSerializer];

    NSURL *url = [NSURL URLWithString:path relativeToURL:httpClient.baseURL];

    NSError *serializationError = nil;
    request = [serializer requestWithMethod:method
                                  URLString:[url absoluteString]
                                 parameters:parameters
                                      error:&serializationError];
    if (serializationError) {
        if (self.shouldLogRequest) {
            NSLog(@"Serialization error: %@", serializationError);
        }
    }

    [self prepareURLRequest:request];

    return request;
}

- (void)prepareURLRequest:(NSMutableURLRequest*)request
{
    // This is a point to customize URL request
    // E.g. set timeout interval or cache policy
    [request setTimeoutInterval:20.0];
    [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
}

@end
