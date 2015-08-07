//
//  API+RequestProgress.m
//  Sample
//
//  Created by Alexander Kozin on 04.07.15.
//  Copyright © 2015 Siberian.pro. All rights reserved.
//

#import "API_Private.h"

@implementation API (RequestProgress)

- (void)sendRequestWithCompletion:(void (^)(id reply, NSError *error, BOOL *handleError))completion
{
    [self setCompletion:completion];

    if ([API networkIsReachable]) {
        [self sendRequest];
    } else {
        [self invokeApiNotReachableSequence];
    }
}

- (void)sendRequest
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        AFHTTPSessionManager *client = [API httpClient];

        NSString *method = [self method];
        NSString *path = [self path];
        NSDictionary *parameters = [self parameters];
        // Prevent appending empty parameters
        if (![parameters isFull]) {
            parameters = nil;
        }

        NSMutableURLRequest *request = [self requestWithMethod:method
                                                          path:path
                                                    parameters:parameters];
        NSURLSessionDataTask *task;
        task = [client dataTaskWithRequest:request
                         completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                             if (error) {
                                 NSError *apiError = [self apiErrorFromNetworkError:error];
                                 [self apiDidFailWithError:apiError];
                             } else {
                                 [self requestDidReturnReply:responseObject];
                             }
                         }];
        [task resume];
        [self setSessionTask:task];

        if (self.shouldLogRequest) {
            NSLog(@"#AF request %@: %@\nHeaders: %@\n Parameters: %@", method,
                  request.URL,
                  request.allHTTPHeaderFields,
                  [self parameters]);
        }
    });
}

- (void)requestDidReturnReply:(id)reply
{
    id parsedReply = reply;

    Class classForParcingReply = [self classForParsingReply];
    if (classForParcingReply) {
        parsedReply = [classForParcingReply objectFromReply:reply];
    }

    [self apiDidReturnReply:parsedReply source:reply];
}

- (Class)classForParsingReply
{
    return NULL;
}

- (void)cancel
{
    [self.sessionTask cancel];
}

- (BOOL)apiRequestInProgress
{
    return self.sessionTask != nil;
}

@end
