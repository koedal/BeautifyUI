//
//  KIGradientView.m
//  BeautifyUI
//
//  Created by Collin Beck on 2/4/12.
//  Copyright (c) 2012 Koedal, Inc. All rights reserved.
//

#import "KIGradientView.h"
#import <QuartzCore/QuartzCore.h>

@implementation KIGradientView

- (void)customUISetup 
{
    self.layer.cornerRadius = 12;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.layer.borderWidth = 1;
//    self.backgroundColor = [UIColor lightGrayColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self customUISetup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self customUISetup];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGGradientRef gradient;
    NSMutableArray *colors;
    UIColor *color;
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint point;
    CGPoint point2;
    CGFloat locations[2];
    
    colors = [NSMutableArray arrayWithCapacity:2];
    color = [UIColor colorWithRed:0.33 green:0.49 blue:0.71 alpha:1.0];
    [colors addObject:(id)[color CGColor]];
    locations[0] = 0.0;
    color = [UIColor colorWithRed:0.10 green:0.39 blue:0.60 alpha:1.0];
    [colors addObject:(id)[color CGColor]];
    locations[1] = 1.0;

    gradient = CGGradientCreateWithColors(space, (__bridge CFArrayRef)colors, locations);
    CGContextSaveGState(context);

    CGFloat point2Radius = (MAX(rect.size.width, rect.size.height) / 2.0) - 5;
    
    CGFloat yScale = (MIN(rect.size.width, rect.size.height) / MAX(rect.size.width, rect.size.height));
    
    point = CGPointMake(rect.size.width / 2, rect.size.height / 2 / yScale);
    point2 = CGPointMake(rect.size.width / 2, rect.size.height / 2 / yScale);
    
    CGContextScaleCTM(context, 1.0, yScale);
    
    CGContextDrawRadialGradient(context, gradient, point, 0.0, point2, point2Radius, (kCGGradientDrawsAfterEndLocation));
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(space);
}

@end
