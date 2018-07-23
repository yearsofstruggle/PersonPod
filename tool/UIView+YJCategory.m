//
//  UIView+YJCategory.m
//  YXIM
//
//  Created by Run on 2018/6/21.
//  Copyright © 2018年 hitwitech. All rights reserved.
//

#import "UIView+YJCategory.h"

@implementation UIView (YJCategory)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


- (UIViewController *)viewController{
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


- (void)drawRaius{
    CGRect rect = self.bounds;
    CGSize radii = CGSizeMake(40, 40);
    UIRectCorner corners = UIRectCornerBottomLeft | UIRectCornerBottomRight ;
    
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor yellowColor].CGColor;
    shapeLayer.lineWidth = 1;
    //线条之间
    shapeLayer.lineJoin = kCALineJoinRound;
    //线条结尾
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    //add it to our view
    [self.layer addSublayer:shapeLayer];
    [self.layer masksToBounds];
}

- (UIRectCorner)cornersByRadiusType:(RadiusType)type{
    UIRectCorner corners;
    switch (type) {
        case RadiusTypeTop:
            corners = UIRectCornerTopLeft | UIRectCornerTopRight;
            break;
            
        case RadiusTypeBottom:
            corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
            
        case RadiusTypeLeft:
            corners = UIRectCornerTopLeft | UIRectCornerBottomLeft;
            break;
    
        case RadiusTypeRight:
             corners = UIRectCornerTopRight | UIRectCornerBottomRight;
            break;
            
        case RadiusTypeTopLeft:
            corners = UIRectCornerTopLeft ;
            break;
            
        case RadiusTypeTopRight:
            corners = UIRectCornerTopRight;
            break;
            
        case RadiusTypeBottomLeft:
            corners = UIRectCornerBottomLeft ;
            break;
            
        case RadiusTypeBottomRight:
            corners =  UIRectCornerBottomRight;
            break;
            
        case RadiusTypeAll:
             corners = UIRectCornerAllCorners;
            break;
   
        default:
            corners = UIRectCornerAllCorners;
            break;
    }
    return corners;
}

- (void)drawRadius:(CGSize)clipSize fillColor:(UIColor *)color corners:(RadiusType)type  {
    CGRect rect = self.bounds;
    CGSize radii = clipSize;
    UIRectCorner corners = [self cornersByRadiusType:type];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = color.CGColor;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.layer addSublayer:shapeLayer];
}

@end
