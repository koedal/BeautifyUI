//
//  KIPhotoShadowDetailsViewController.h
//  BeautifyUI
//
//  Created by Collin Beck on 2/4/12.
//  Copyright (c) 2012 Koedal, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMShadowView.h"

@interface KIPhotoShadowDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *changeShadowButton;
@property (strong, nonatomic) IBOutlet PMShadowView *imageShadowView;
- (IBAction)changeShadow:(id)sender;


@end
