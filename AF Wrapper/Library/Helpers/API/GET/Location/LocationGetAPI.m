//
//  LocationGetAPI.m
//  AF Wrapper
//
//  Created by Pavel Deminov on 01/12/15.
//  Copyright © 2015 Siberian.pro. All rights reserved.
//

#import "LocationGetAPI.h"
#import "API_Private.h"

#import "LocationModel.h"

@implementation LocationGetAPI

- (void)prepare
{
    [super prepare];
    
    [self setShouldLogRequest:YES];
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
    NSError *deserializingError;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Location" ofType:@"json"];
    NSURL *localFileURL = [NSURL fileURLWithPath:filePath];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
    id object = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                options:0
                                                  error:&deserializingError];
    
    LocationModel *location = [LocationModel objectFromReply:object];
    [super apiDidReturnReply:location source:source];
    
}

@end
