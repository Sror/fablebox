//
//  FBSettingsViewController.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@interface FBSettingsViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *userId;
@property (strong, nonatomic) IBOutlet UILabel *contentLanguages;
@property (strong, nonatomic) IBOutlet UILabel *downloadedFableCount;

-(IBAction)showSideMenu:(id)sender;

@end
