//
//  FBSideMenuViewController.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBSideMenuViewCell.h"


@interface FBSideMenuViewController : UITableViewController

@property (weak, nonatomic) IBOutlet FBSideMenuViewCell *navigateToOutagesCell;
@property (weak, nonatomic) IBOutlet FBSideMenuViewCell *navigateToSettingsCell;
@property (weak, nonatomic) IBOutlet FBSideMenuViewCell *navigateToAboutCell;

@end
