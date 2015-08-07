//
//  NSObject+Utils.m
//  Test
//
//  Created by Alexander Kozin on 5/2/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

#import "NSObject+Utils.h"

#import "MessageCenter.h"

@implementation NSObject (Utils)

+ (id)controllerFromXib
{
    id object = [self object];
    [[NSBundle mainBundle] loadNibNamed:[self nibName] owner:object options:nil];
    return object;
}

+ (id)object
{
    return [[self alloc] init];
}

+ (id)objectFromXib
{
    return [self objectFromXib:[self nibName]];
}

+ (id)objectFromXib:(NSString*)nibName
{
    id cell = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] objectAtIndex:0];
    
    return cell;
}

+ (NSString*)nibName
{
    NSString *className = NSStringFromClass([self class]);
    return className;
}

@end
