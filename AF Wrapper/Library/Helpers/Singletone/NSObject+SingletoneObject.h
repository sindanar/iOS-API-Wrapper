//
//  NSObject+SingletonObject.m
//
//  Created by Alko on 24/01/14.
//

#import <Foundation/Foundation.h>

@interface NSObject (SingletoneObject)

+ (instancetype)shared;
+ (void)setShared:(id)shared;

- (void)prepare;

@end
