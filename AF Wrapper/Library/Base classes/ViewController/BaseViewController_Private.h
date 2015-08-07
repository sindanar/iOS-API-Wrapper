//
//  BaseViewController_Private.h
//
//  Created by Alko on 5/15/13.
//
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, retain) UISwipeGestureRecognizer *swipeGestureRecognizer;

@end

@interface BaseViewController (BaseUI)

+ (void)prepareBaseUI;

@end

@interface BaseViewController (Orientation)

@end
