//
//  FBSettingsViewController.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "MFSideMenu.h"
#import "FBAppDelegate.h"
#import "FBFileManager.h"
#import "FBSettingsViewController.h"

@interface FBSettingsViewController ()

@end

@implementation FBSettingsViewController


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
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap.cancelsTouchesInView = false;
    [self.tableView addGestureRecognizer:tap];
}

- (void)viewWillAppear:(BOOL)animated
{
    FBAppDelegate *appDelegate = (FBAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeDefault;
    
    // set styles
//    self.view.backgroundColor = UIColorFromRGB(BGCOLOR);
//    self.tableView.backgroundView = nil;
    
    // load user settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *userId = [defaults valueForKey:APP_USER_ID];
    self.userId.text = userId;
    NSMutableArray *contentLangs = [defaults valueForKey:APP_CONTENT_LANGS];
    self.contentLanguages.text = [contentLangs componentsJoinedByString:@","];
    NSInteger downloadedFableCount = [[FBFileManager sharedSingleton] countOfDownloadedFables];
    self.downloadedFableCount.text = [NSString stringWithFormat:@"%d", downloadedFableCount];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)showSideMenu:(id)sender
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"tap began");
    [self.view endEditing:YES];
}

@end
