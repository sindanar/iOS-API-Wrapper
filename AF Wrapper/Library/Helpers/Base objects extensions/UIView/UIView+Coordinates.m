//
//  UIView+Coordinates.m
//
//  Created by Alexander Kozin on 6/22/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Coordinates)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    
    [self setFrame:frame];
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    
    [self setFrame:frame];
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    
    [self setFrame:frame];
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;

    [self setFrame:frame];
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    
    [self setFrame:frame];
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;

    [self setFrame:frame];
}

- (CGSize)size
{
    return self.bounds.size;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)snapViewCorner:(UIViewCorner)corner toPoint:(CGPoint)point
{
    CGPoint pointConvertedToOrigin = point;
    if (corner == UIViewRightTopCorner) {
        pointConvertedToOrigin.x -= self.width;
    } else if (corner == UIViewRightBottomCorner) {
        pointConvertedToOrigin.x -= self.width;
        pointConvertedToOrigin.y -= self.height;
    } else if (corner == UIViewLeftBottomCorner) {
        pointConvertedToOrigin.y -= self.height;
    }
    
    [self setOrigin:pointConvertedToOrigin];
}

- (CGPoint)viewCorner:(UIViewCorner)corner
{
    CGPoint point = self.origin;
    if (corner == UIViewRightTopCorner) {
        point.x += self.width;
    } else if (corner == UIViewRightBottomCorner) {
        point.x += self.width;
        point.y += self.height;
    } else if (corner == UIViewLeftBottomCorner) {
        point.y += self.height;
    }
    
    return point;
}

@end
