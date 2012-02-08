//
//  KIGradientView.m
//  BeautifyUI
//
//  Created by Collin Beck on 2/4/12.
//  Copyright (c) 2012 Koedal, Inc. All rights reserved.
//

/*
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 * Neither the name of the <organization> nor the
 names of its contributors may be used to endorse or promote products
 derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
