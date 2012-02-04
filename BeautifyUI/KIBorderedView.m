//
//  KIBorderedView.m
//  PhotoMind
//
//  Created by Collin Beck on 11/25/11.
//  Copyright (c) 2011 Koedal, Inc. All rights reserved.
//

#import "KIBorderedView.h"

@implementation KIBorderedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)awakeFromNib {
    self.contentScaleFactor = [[UIScreen mainScreen] scale];
    self.backgroundColor = [UIColor clearColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    
    // Draw black line
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 0.0, 0.3};
    CGColorRef blackColor = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, blackColor);
    
    CGContextMoveToPoint(context, 0, rect.size.height - 1.5);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height - 1.5);
    CGContextStrokePath(context);
    CGColorRelease(blackColor);
    
    // Draw white bottom line
    CGFloat whiteComponents[] = {1.0, 1.0, 1.0, 1.0};
    CGColorRef whiteColor = CGColorCreate(colorspace, whiteComponents);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    
    CGContextMoveToPoint(context, 0, rect.size.height - 0.5);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height - 0.5);
    CGContextStrokePath(context);
    CGColorRelease(whiteColor);
    
    // Draw top white line
    CGFloat whiteTransparentComponents[] = {1.0, 1.0, 1.0, 0.15};
    CGColorRef whiteTransparentColor = CGColorCreate(colorspace, whiteTransparentComponents);
    
    CGContextSetStrokeColorWithColor(context, whiteTransparentColor);
    
    CGContextMoveToPoint(context, 0, 0.5);
    CGContextAddLineToPoint(context, rect.size.width, 0.5);
    CGContextStrokePath(context);
    CGColorRelease(whiteTransparentColor);
    


    CGColorSpaceRelease(colorspace);
}


@end
