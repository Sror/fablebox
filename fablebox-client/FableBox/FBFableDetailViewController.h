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

@interface FBFableDetailViewController : UIViewController <AVAudioPlayerDelegate>

@property (strong, nonatomic) FBFable *fable;

@property (weak, nonatomic) IBOutlet UILabel *guid;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *dateAdded;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UILabel *isPaid;

@property (weak, nonatomic) IBOutlet UIImageView *fableImageView;
@property (weak, nonatomic) IBOutlet UILabel *fableImageLoadingLabel;
@property (weak, nonatomic) IBOutlet UIView *playerView;
@property (weak, nonatomic) IBOutlet UIView *downloadingView;


@property (weak, nonatomic) IBOutlet UIButton *togglePlayPauseButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel  *duration;
@property (weak, nonatomic) IBOutlet UILabel  *downloadProgressStatus;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgressView;

- (IBAction)togglePlayPauseTapped:(id)sender;
- (IBAction)sliderDragged:(id)sender;

@end
