//
//  FBFableDetailViewController.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@class FBFable;

@interface FBFableDetailViewController : UITableViewController <AVAudioPlayerDelegate>

@property (strong, nonatomic) FBFable *fable;

@property (weak, nonatomic) IBOutlet UILabel *guid;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *dateAdded;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UILabel *isPaid;

@property (weak, nonatomic) IBOutlet UIButton *togglePlayPause;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel  *duration;
@property (weak, nonatomic) IBOutlet UILabel  *progressStatus;

- (IBAction)togglePlayPauseTapped:(id)sender;
- (IBAction)sliderDragged:(id)sender;

@end
