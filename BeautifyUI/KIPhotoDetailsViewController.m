//
//  KIPhotoDetailsViewController.m
//  PhotoCenter
//
//  Created by Collin Beck on 2/4/12.
//  Copyright (c) 2012 Koedal, Inc. All rights reserved.
//

#import "KIPhotoDetailsViewController.h"
#import "KIBeautifyUIConstants.h"

typedef enum {
    KITableRowPictureCamera,
    KITableRowPictureCameraLens,
    KITableRowPictureDetails,
    KITablePictureRows,
} KITableSections;

@implementation KIPhotoDetailsViewController

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor babyPinkColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillDisappear:(BOOL)animated 
{
    self.navigationController.navigationBar.tintColor = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    switch (indexPath.row) {
        case KITableRowPictureCamera:
            cell = [tableView dequeueReusableCellWithIdentifier:@"Camera"];            
            break;
        case KITableRowPictureCameraLens:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Camera"];
            UILabel *textLabel = (UILabel *)[cell viewWithTag:10];
            textLabel.text = @"Canon EF 50mm f/1.8 II";
        }
            break;
        case KITableRowPictureDetails:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PictureDetails"];
        default:
            break;
    }
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 3;
    
    return numberOfRows;
}

@end
