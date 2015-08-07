//
//  GetAPI.m
//
//  Created by Alexander Kozin on 3/13/13.
//  Copyright (c) 2013 Alexander Kozin. All rights reserved.
//

#import "GetAPI.h"
#import "API_Private.h"

@implementation GetAPI

- (NSString *)method
{
    return @"GET";
}

//- (void)sendRequestWithCompletion:(void (^)(id reply, NSError *error, BOOL *handleError))completion
//{
//    [self setCompletion:completion];
//
//    [self sendRequest];
//}
//
//- (void)sendRequest
//{
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(globalQueue, ^{
//
//        NSString *method = [self method];
//        NSString *path = [self path];
//        NSDictionary *parameters = [self parameters];
//        // Prevent appending empty parameters
//        if (![parameters isFull]) {
//            parameters = nil;
//        }
//
//        NSMutableURLRequest *request = [self requestWithMethod:method
//                                                          path:path
//                                                    parameters:parameters];
//        NSString *resourceName = [NSString stringWithFormat:@"%@_%@", method, request.URL];
//
//        NSCharacterSet *restrictedSet = [NSCharacterSet characterSetWithCharactersInString:@"/:"];
//        NSArray *componets = [resourceName componentsSeparatedByCharactersInSet:restrictedSet];
//        resourceName = [componets componentsJoinedByString:@"_"];
//
//        NSString *stabPath = [[NSBundle mainBundle] pathForResource:resourceName
//                                                             ofType:@"json"];
//        NSError *e = nil;
//        NSData *data = [[NSData alloc] initWithContentsOfFile:stabPath];
//        NSDictionary *source = nil;
//        if (data) {
//            source = [NSJSONSerialization JSONObjectWithData:data
//                                                     options:0
//                                                       error:&e];
//        }
//        if (source) {
//            [self apiDidReturnReply:source source:source];
//        } else {
//            NSError *error = [NSError errorWithDomain:@""
//                                                 code:0
//                                             userInfo:nil];
//            [self apiDidFailWithError:error];
//        }
//
//        if (self.shouldLogRequest) {
//            NSLog(@"#AF request %@: %@\nHeaders: %@\n Parameters: %@", method,
//                  request.URL,
//                  request.allHTTPHeaderFields,
//                  [self parameters]);
//        }
//    });
//}

@end
