//
//  BaseNavigationController.h
//
//  Created by Alexander Kozin on 2/7/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

@class BaseDataObject;

@interface BaseNavigationController : UINavigationController

+ (id)navigationControllerWithRoot:(UIViewController*)viewController;

@end
