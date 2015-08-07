//
//  AddGistAPI.m
//  
//
//  Created by Alexander Kozin on 12.07.15.
//
//

#import "AddGistAPI.h"
#import "API_Private.h"

#import "Gist.h"

@implementation AddGistAPI

- (void)prepare
{
    [super prepare];

    [self setShouldLogRequest:YES];
}

- (NSString *)path
{
    return kAPIGistsURL;
}

- (Class)classForParsingReply
{
    return [AWMissedProperties class];
}

@end
