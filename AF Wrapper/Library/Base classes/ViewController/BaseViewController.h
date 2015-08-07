//
//  BaseViewController.h
//
//  Created by Alexander Kozin on 2/3/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

@import UIKit;

@interface BaseViewController : UIViewController

+ (id)navigationController;
+ (id)viewController;

/**
 Method for cleaning memory when warning received

 @warning Should be never called directly
 */
- (void)cleanMemory;

- (void)debugNext;

@end
