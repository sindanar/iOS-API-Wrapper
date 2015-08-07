//
//  BaseNavigationController.m
//
//  Created by Alexander Kozin on 2/7/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController

+(id)navigationControllerWithRoot:(UIViewController*)viewController
{
    BaseNavigationController *controller = [[self alloc] initWithRootViewController:viewController];
    [controller setNavigationBarHidden:YES];
    
    // Turns swipe to pop gesture without nav bar
    //[controller.interactivePopGestureRecognizer setDelegate:nil];
    
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self customizeUI];
}

- (void)customizeUI
{
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self cleanMemory];
}

- (void)dealloc
{
    [self cleanMemory];
}
     
-(void)cleanMemory
{
}

@end
