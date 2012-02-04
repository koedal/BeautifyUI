//
//  PMShadowView.m
//  PhotoMind
//
//  Created by Collin Beck on 3/19/11.
//  Copyright 2011 Koedal, Inc. All rights reserved.
//

#import "PMShadowView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PMShadowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // Add a shadow around the view
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    self.layer.shadowPath = path;
    CGPathRelease(path);
    self.layer.shadowOpacity = 0.7;
    self.layer.shadowOffset = CGSizeMake(0.0, 3.0);
}



@end
