//
//  FBSideMenuViewController.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "MFSideMenu.h"
#import "FBSideMenuViewCell.h"
#import "FBSideMenuViewController.h"

@interface FBSideMenuViewController ()

@end

@implementation FBSideMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(SIDE_VIEW_ETCH_LIGHT_COLOR);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *clickedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    UIViewController *targetViewController = nil;
    
    if (clickedCell == self.navigateToOutagesCell)
    {
        targetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FBFablesViewController"];
        //        targetViewController.title = @"Outages";
    }
    else if (clickedCell == self.navigateToSettingsCell)
    {
        targetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FBSettingsViewController"];
        //        targetViewController.title = @"Settings";
    }
    else if (clickedCell == self.navigateToAboutCell)
    {
        targetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FBAboutViewController"];
        //        targetViewController.title = @"Outages";
    }
    
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:targetViewController];
    navigationController.viewControllers = controllers;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}

@end
