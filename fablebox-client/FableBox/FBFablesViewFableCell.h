//
//  FBFablesViewFableCell.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@class FBFable;

@interface FBFablesViewFableCell : UITableViewCell

@property (nonatomic, weak) FBFable *fable;

@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *length;
@property (nonatomic, weak) IBOutlet UIImageView *imageSmall;
@property (nonatomic, weak) IBOutlet UILabel *imageSmallLoadingLabel;

- (void) downloadAndSetFableImage:(FBFileManager*)fileManager;

@end
