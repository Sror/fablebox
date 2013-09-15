//
//  FBFablesViewController.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@class FBFableService;

@interface FBFablesViewController : UITableViewController

- (IBAction)showSideMenu:(id)sender;
- (IBAction)listFables:(UIStoryboardSegue *)unwindSegue;

@end
