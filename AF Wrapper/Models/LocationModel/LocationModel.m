//
//  LocationModel.m
//  AF Wrapper
//
//  Created by Pavel Deminov on 01/12/15.
//  Copyright © 2015 Siberian.pro. All rights reserved.
//

#import "LocationModel.h"
#import "AWModel.h"

@implementation LocationModel

+ (NSString *)latitudeMapping
{
    return @"latitude";
}

+ (NSString *)longitudeMapping
{
    return @"longitude";
}

//- (void)setLocation:(NSValue *)location
//{
//    _location = location;
//    
//    CLLocationCoordinate2D coordinates;
//    coordinates.longitude = 1.0;
//    coordinates.latitude = 2;
//    _location = [NSValue value:&coordinates withObjCType:@encode(CLLocationCoordinate2D)];
//    
//    [_location getValue:&coordinates];
//    self.coordinates = coordinates;
//    
//    id value = [self valueForKey:@"coordinates"];
//    const char* objCType = [value objCType];
//    NSLog(@"%s",objCType);
//}
@end
