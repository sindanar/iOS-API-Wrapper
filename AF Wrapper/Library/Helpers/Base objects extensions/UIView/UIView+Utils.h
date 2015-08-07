//
//  UIView+Utils.h
//
//  Created by Alexander Kozin on 6/15/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    UIViewLeftTopCorner,
    UIViewRightTopCorner,
    UIViewRightBottomCorner,
    UIViewLeftBottomCorner,
} UIViewCorner;

@interface UIView (Utils)

+ (instancetype)viewWithFrame:(CGRect)frame;
- (CGRect)frameInView:(UIView*)view;
- (CGPoint)centerInView:(UIView*)view;

- (void)bringToFront;

@end

@interface UIView (Coordinates)

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;

- (void)setWidth:(CGFloat)width;

- (void)setHeight:(CGFloat)height;

- (void)setOrigin:(CGPoint)origin;
- (CGPoint)origin;
- (void)setSize:(CGSize)size;
- (CGSize)size;

- (void)snapViewCorner:(UIViewCorner)corner toPoint:(CGPoint)point;
- (CGPoint)viewCorner:(UIViewCorner)corner;

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

@end

#define UIViewGetWidth(view) CGRectGetWidth(view.frame)
#define UIViewGetHeight(view) CGRectGetHeight(view.frame)

#define UIViewGetMinX(view) CGRectGetMinX(view.frame)
#define UIViewGetMaxX(view) CGRectGetMaxX(view.frame)

#define UIViewGetMinY(view) CGRectGetMinY(view.frame)
#define UIViewGetMaxY(view) CGRectGetMaxY(view.frame)

#define CGRectFromSize(size) (CGRect){CGPointZero, size}
