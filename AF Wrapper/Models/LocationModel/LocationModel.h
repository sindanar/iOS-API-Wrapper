//
//  LocationModel.h
//  AF Wrapper
//
//  Created by Pavel Deminov on 01/12/15.
//  Copyright © 2015 Siberian.pro. All rights reserved.
//

#import "BaseModel.h"

@import MapKit;

@interface LocationModel : BaseModel

//@property (nonatomic, strong) NSValue *location;
@property (nonatomic) CLLocationCoordinate2D location;
@end
