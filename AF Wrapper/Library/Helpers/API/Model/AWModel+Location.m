//
//  AWModel+Location.m
//  AF Wrapper
//
//  Created by Pavel Deminov on 20/12/15.
//  Copyright © 2015 Siberian.pro. All rights reserved.
//

#import "AWModel.h"
@import MapKit;

@import Foundation;

@implementation AWModel (Location)

+ (NSString *)latitudeMapping
{
    return @"lat";
}

+ (NSString *)longitudeMapping
{
    return @"long";
}

+ (NSValue*)getValueForLocation:(NSDictionary*)dict
{
    NSNumber *latitude = dict[[self latitudeMapping]];
    NSNumber *longitude = dict[[self longitudeMapping]];
    CLLocationCoordinate2D location = {latitude.doubleValue, longitude.doubleValue};
    NSValue *v = [NSValue value:&location withObjCType:@encode(CLLocationCoordinate2D)];
    return v;
}



@end
