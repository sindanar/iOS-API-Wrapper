//
//  GistFile.m
//  
//
//  Created by Alexander Kozin on 14.07.15.
//
//

#import "GistFile.h"

#import "AWModel.h"

@implementation GistFile

- (NSMutableDictionary *)fullObject
{
    NSMutableDictionary *fullObject = [self objectForKeys:@[@"text"]];
    return fullObject;
}

+ (NSDictionary *)mapProperties
{
    return @{@"content": @"text"};
}

@end
