//
//  FBFablesViewController.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@class FBFableDataProvider;

@interface FBFablesViewController : UITableViewController

@property (strong, nonatomic) FBFableDataProvider *dataProvider;

- (IBAction)showSideMenu:(id)sender;
- (IBAction)listFables:(UIStoryboardSegue *)unwindSegue;


@end
