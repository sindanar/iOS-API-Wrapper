//
//  NSObject+Notifications.m
//
//  Created by алко on 8/13/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

#import "NSObject+Utils.h"

@implementation NSObject (Notifications)

- (void)addKeyboardWillShowNotificationObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)addKeyboardWillHideNotificationObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)addNotificationObserver:(NSString*)name
{
    NSString *selector = [name stringByAppendingString:@":"];
    [self addNotificationObserver:name selector:NSSelectorFromString(selector)];
}

- (void)addNotificationObserver:(NSString*)name selector:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:selector name:name object:nil];
}

- (void)addMemoryWarningObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidReceiveMemoryWarning:)
                                                 name:UIApplicationDidReceiveMemoryWarningNotification
                                               object:nil];
}

- (void)applicationDidReceiveMemoryWarning:(NSNotification*)n
{
}

- (void)removeNotificationObservers
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)postNotification:(NSString*)name
{
    [self postNotification:name withInfo:nil];
}

- (void)postNotification:(NSString*)name withInfo:(NSDictionary*)info
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:self userInfo:info];
}

- (void)keyboardWillShow:(NSNotification*)notification
{
}

- (void)keyboardWillHide:(NSNotification*)notification
{
}

@end
