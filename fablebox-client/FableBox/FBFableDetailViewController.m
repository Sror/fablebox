//
//  FBFableDetailViewController.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBAppDelegate.h"
#import "FBFable.h"
#import "FBFableDetailViewController.h"

@interface FBFableDetailViewController ()

@end

@implementation FBFableDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    FBAppDelegate *appDelegate = (FBAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setFable:(id)newFable
{
    if (_fable != newFable)
    {
        _fable = newFable;
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    FBFable *theFable = self.fable;
    
    if (theFable)
    {
        self.name.text = theFable.name;
        self.dateAdded.text = [FBUtils formatDate:theFable.dateAdded];
        self.length.text = [NSString stringWithFormat:@"%i", theFable.lengthInSeconds];
        self.isPaid.text = theFable.isPaid > 0 ? @"PAID" : @"FREE";
    }
}

@end
