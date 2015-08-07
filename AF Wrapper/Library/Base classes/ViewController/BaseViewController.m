//
//  BaseViewController.m
//
//  Created by Alexander Kozin on 2/3/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

#import "BaseViewController_Private.h"

#import "BaseNavigationController.h"

@implementation BaseViewController

+ (NSString*)nibName
{
    return NSStringFromClass([self class]);
}

+ (void)initialize
{
    [self prepareBaseUI];
}

+ (id)navigationController
{
    UIViewController *viewController = [self viewController];
    UINavigationController *controller = [BaseNavigationController navigationControllerWithRoot:viewController];
    
    return controller;
}

+ (id)viewController
{
    id viewController = [[self alloc] initWithNibName:[self nibName] bundle:nil];
    
    return viewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setClipsToBounds:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
#if ENABLE_DUBEG_TRANSACTIONS
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self debugNext];
    });
#endif
}

- (IBAction)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)pushViewControllerWithClass:(Class)controllerClass
{
    id controller = [controllerClass viewController];
    [self.navigationController pushViewController:controller animated:TRUE];
}

- (void)debugNext
{
}

- (void)dealloc
{
    [self cleanMemory];
}

-(void)cleanMemory
{
}

@end
