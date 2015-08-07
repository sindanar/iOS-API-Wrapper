//
//  BaseViewController+Orientation.m
//  Auto
//
//  Created by Alko on 6/4/13.
//  Copyright (c) 2013 company. All rights reserved.
//

#import "BaseViewController_Private.h"

@implementation BaseViewController (Orientation)

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

@end
