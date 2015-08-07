//
//  NSObject+ClassName.m
//  
//
//  Created by Alexander Kozin on 10.07.15.
//
//

#import "NSObject+ClassName.h"

@implementation NSObject (ClassName)

+ (NSString *)className
{
    return NSStringFromClass(self);
}

@end

@implementation NSDictionary (ClassName)

+ (NSString *)className
{
    return @"NSDictionary";
}

@end

@implementation NSNumber (ClassName)

+ (NSString *)className
{
    return @"NSNumber";
}

@end

@implementation NSString (ClassName)

+ (NSString *)className
{
    return @"NSString";
}

@end
