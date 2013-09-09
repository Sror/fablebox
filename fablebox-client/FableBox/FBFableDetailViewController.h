//
//  FBFableDetailViewController.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@class FBFable;

@interface FBFableDetailViewController : UITableViewController

@property (strong, nonatomic) FBFable *fable;

@property (weak, nonatomic) IBOutlet UILabel *guid;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *dateAdded;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UILabel *isPaid;

@end
