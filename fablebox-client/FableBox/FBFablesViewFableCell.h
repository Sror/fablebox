//
//  FBFablesViewFableCell.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@interface FBFablesViewFableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *dateAdded;
@property (nonatomic, weak) IBOutlet UILabel *length;
@property (nonatomic, weak) IBOutlet UILabel *isPaid;
@property (nonatomic, weak) IBOutlet UIImageView *imageSmall;

@end
