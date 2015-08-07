//
//  NSObject+Observers.m
//
//  Created by алко on 8/2/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

#import "NSObject+Utils.h"

@implementation NSObject (Observers)

- (void)addObserverForNewValueOf:(NSString*)keyPath {
    
    [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSString *selectorString = [NSString stringWithFormat:@"%@Changed", keyPath];
    SEL selector = NSSelectorFromString(selectorString);
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([self respondsToSelector:selector])
        [self performSelector:selector];
#pragma clang diagnostic pop
}

- (void)removeObserverFor:(NSString*)keyPath
{
    [self removeObserver:self forKeyPath:keyPath];
}

@end
