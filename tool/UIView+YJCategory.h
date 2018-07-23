//
//  UIView+YJCategory.h
//  YXIM
//
//  Created by Run on 2018/6/21.
//  Copyright © 2018年 hitwitech. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 圆角类型 */
typedef NS_ENUM(NSUInteger, RadiusType) {
    RadiusTypeAll,
    RadiusTypeTop,
    RadiusTypeLeft,
    RadiusTypeBottom,
    RadiusTypeRight,
    RadiusTypeTopLeft,
    RadiusTypeBottomLeft,
    RadiusTypeTopRight,
    RadiusTypeBottomRight,
};

@interface UIView (YJCategory)

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;


- (UIViewController *)viewController;

- (void)drawRadius:(CGSize)clipSize fillColor:(UIColor *)color corners:(RadiusType)type;


@end
