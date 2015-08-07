//
//  API+ReplyHandling.m
//  Sample
//
//  Created by Alexander Kozin on 04.07.15.
//  Copyright © 2015 Siberian.pro. All rights reserved.
//

#import "API_Private.h"

#import "MessageCenter.h"

#import <isFull.h>

@implementation API (ReplyHandling)

- (void)apiDidReturnReply:(id)reply source:(id)source
{
    if (self.shouldLogRequest) {
        NSLog(@"#Request %@ DONE: %@ Reply: %@", [self method], self.sessionTask.currentRequest.URL, reply);
    } else {
        NSLog(@"#Request %@ DONE: %@", [self method], self.sessionTask.currentRequest.URL);
    }

    [self setLastReply:reply];
    [self setLastError:nil];

    if (self.completion) {
        self.completion(reply, nil, NULL);
    }

    [self apiDidEnd];
}

- (void)apiDidFailWithError:(NSError*)error
{
    if (self.shouldLogRequest) {
        NSLog(@"#Request %@ FAIL: %@ with EROR: %@", [self method], self.sessionTask.currentRequest.URL, error);
    } else {
        NSLog(@"#Request %@ FAIL: %@", [self method], self.sessionTask.currentRequest.URL);
    }

    [self setLastReply:nil];
    [self setLastError:error];

    BOOL shouldUseDefaultErrorHandler = YES;

    if (self.completion) {
        self.completion(nil, error, &shouldUseDefaultErrorHandler);
    }

    if (shouldUseDefaultErrorHandler) {
        [MessageCenter showError:error];
    }

    [self apiDidEnd];
}

- (void)apiDidEnd
{
    [self setSessionTask:nil];
}

- (NSError *)apiErrorFromNetworkError:(NSError *)networkError
{
    NSError *apiError;

    NSDictionary *userInfo = networkError.userInfo;
    NSString *suggestionString = userInfo[@"NSLocalizedRecoverySuggestion"];
    NSDictionary *suggestion = nil;
    if ([suggestionString isFull]) {
        suggestion = [NSJSONSerialization JSONObjectWithData:[suggestionString dataUsingEncoding:NSUTF8StringEncoding]
                                                     options:0
                                                       error:nil];
    }

    if ([suggestion isFull]) {
        NSDictionary *error = suggestion[@"error"];

        NSInteger code = 0;
        id codeNumber = error[@"code"];
        if ([codeNumber isFull]) {
            code = [codeNumber integerValue];
        }

        apiError = [NSError errorWithDomain:networkError.domain
                                       code:code
                                   userInfo:userInfo];
    } else {
        apiError = networkError;
    }
    
    return apiError;
}

@end
