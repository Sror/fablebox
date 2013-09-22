//
//  FBContentLanguageControllerViewController.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/22/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "MFSideMenu.h"
#import "FBAppDelegate.h"
#import "FBContentLanguageControllerViewController.h"

@interface FBContentLanguageControllerViewController ()

@end

@implementation FBContentLanguageControllerViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    FBAppDelegate *appDelegate = (FBAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeNone;
    
    // load content language settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.selectedLanguages = [[defaults valueForKey:APP_CONTENT_LANGS] mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *lang = ((UILabel *)[cell viewWithTag:100]).text;
    BOOL isSelectedLang = [self.selectedLanguages containsObject:[FBUtils getLangCode:lang]];
    cell.accessoryType = isSelectedLang ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *lang = ((UILabel *)[selectedCell viewWithTag:100]).text;
    
    NSString *langCode = [FBUtils getLangCode:lang];
    if([self.selectedLanguages containsObject:langCode])
    {
        if ([self.selectedLanguages count] > 1)
        {
            [self.selectedLanguages removeObject:langCode];
        }
    }
    else
    {
        [self.selectedLanguages addObject:langCode];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.selectedLanguages forKey:APP_CONTENT_LANGS];
    [defaults synchronize];
    
    NSLog(@"Selected content languages saved.");
    [self.tableView reloadData];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // then back to settings window
    //[self performSegueWithIdentifier: @"backToSettingsViewAfterLanguageChanged" sender: self];
}

@end
