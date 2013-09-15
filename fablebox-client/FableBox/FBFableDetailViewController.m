//
//  FBFableDetailViewController.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <IADownloadManager.h>
#import "FBAppDelegate.h"
#import "FBFable.h"
#import "FBFableDetailViewController.h"
#import "FBFileManager.h"


@interface FBFableDetailViewController ()

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *sliderTimer;
@property (strong, nonatomic) FBFileManager *fileManager;

@end

@implementation FBFableDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    
    self.fileManager = [FBFileManager sharedSingleton];
    [self handleFableAudio];
    [self handleFableImage];
}

- (void)viewWillAppear:(BOOL)animated
{
    FBAppDelegate *appDelegate = (FBAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.container.panMode = MFSideMenuPanModeNone;
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.audioPlayer stop];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setFable:(id)newFable
{
    if (_fable != newFable)
    {
        _fable = newFable;
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    FBFable *theFable = self.fable;
    
    if (theFable)
    {
        self.name.text = theFable.name;
        self.dateAdded.text = [FBUtils formatDate:theFable.dateAdded];
        self.length.text = [NSString stringWithFormat:@"%i", theFable.lengthInSeconds];
        self.isPaid.text = theFable.isPaid > 0 ? @"PAID" : @"FREE";
    }
}


- (IBAction)togglePlayPauseTapped:(id)sender
{
    if(self.togglePlayPause.selected)
    {
        [self.audioPlayer pause];
        [self.togglePlayPause setSelected:NO];
    }
    else
    {
        [self.audioPlayer play];
        [self.togglePlayPause setSelected:YES];
    }
}

- (void) handleFableAudio
{
    NSString *fableId = self.fable.guid;
    NSData *audioData = [self.fileManager loadFableAudioWithId:fableId];
    
    if(audioData == nil)
    {
        NSURL *url = [NSURL URLWithString:@"http://192.168.1.64:3000/100100"];
        //    NSURL *url = [self.fileManager getUrlForUrlPath:URL_FABLE_AUDIO withFableId:self.fable.guid];
        [IADownloadManager downloadItemWithURL:url useCache:NO];
        
        [IADownloadManager attachListenerWithObject:self
                progressBlock:^(float progress, NSURL *url)
                {
                    self.progressStatus.text = [NSString stringWithFormat:@"Indiriliyor %% %f", (progress * 100)];
                }
                completionBlock:^(BOOL success, id response)
                {
                    NSLog(@"Fable audio download success.");
                    // save downloaded file
                    [self.fileManager saveFableAudioWithId:self.fable.guid downloadedData:response];
                }
                toURL:url];
    }
    else
    {
        self.progressStatus.text = @"";
        NSError *error = nil;
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:audioData error:&error];
        if(error)
        {
            NSLog(@"%@", error);
        }
        
        self.sliderTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
        self.slider.maximumValue = self.audioPlayer.duration;
        [self.slider addTarget:self action:@selector(sliderDragged:) forControlEvents:UIControlEventValueChanged];
        
        [self.audioPlayer setDelegate:self];
        [self.audioPlayer play];
    }
}

- (IBAction)sliderDragged:(id)sender
{
    [self.audioPlayer stop];
    [self.audioPlayer setCurrentTime:self.slider.value];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
}

- (void)updateSlider
{
    self.slider.value = self.audioPlayer.currentTime;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    // Music completed
    if (flag)
    {
        [self.sliderTimer invalidate];
    }
}

- (void) handleFableImage
{
    
    
    
}



@end
