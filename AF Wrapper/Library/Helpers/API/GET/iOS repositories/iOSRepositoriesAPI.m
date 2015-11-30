//
//  SubscribeToRestaurantAPI.m
//  Dishero
//
//  Created by Alexander Kozin on 03.07.14.
//  Copyright (c) 2014 Dishero Inc. All rights reserved.
//

#import "iOSRepositoriesAPI.h"
#import "API_Private.h"

#import "Repo.h"

@implementation iOSRepositoriesAPI

- (void)prepare
{
    [super prepare];

    //[self setShouldLogRequest:YES];
}

- (NSString *)path
{
    return kAPIiOSRepositoriesURL;
}

- (NSMutableDictionary *)parameters
{
    NSMutableDictionary *parameters = [super parameters];
    parameters[@"q"] = @"ios";

    return parameters;
}

- (void)apiDidReturnReply:(id)reply source:(id)source
{
    NSDate *dateBefore = [NSDate date];
    
    NSArray *parsedReply = [Repo objectFromReply:reply[@"items"]];
    
    NSDate *dateAfter = [NSDate date];
    
    NSTimeInterval distanceBetweenDates = [dateAfter timeIntervalSinceDate:dateBefore];
    NSLog(@"%f",distanceBetweenDates);
    [super apiDidReturnReply:parsedReply source:source];
}

@end
