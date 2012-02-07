//
//  KIPhotoShadowDetailsViewController.m
//  BeautifyUI
//
//  Created by Collin Beck on 2/4/12.
//  Copyright (c) 2012 Koedal, Inc. All rights reserved.
//

#import "KIPhotoShadowDetailsViewController.h"
#import "KIBeautifyUIConstants.h"
#import <QuartzCore/QuartzCore.h>

@implementation KIPhotoShadowDetailsViewController
@synthesize imageShadowView;
@synthesize imageView;
@synthesize changeShadowButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewWillDisappear:(BOOL)animated 
{
    self.navigationController.navigationBar.tintColor = nil;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Configure display of image
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 5.0;
    
    UIImage *buttonBackground = [UIImage imageNamed:@"blue_button.png"];
    [self.changeShadowButton setBackgroundImage:[buttonBackground resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)] 
                                       forState:UIControlStateNormal];
    
    self.navigationController.navigationBar.tintColor = [UIColor mosconeBlueColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"light_blue_paper.png"]];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setChangeShadowButton:nil];
    [self setImageShadowView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeShadow:(id)sender {
    [UIView animateWithDuration:2.0 animations:^{
    self.imageShadowView.layer.shadowOpacity = 0.9;
    self.imageShadowView.layer.shadowRadius = 8.0;
    }];
}
@end
