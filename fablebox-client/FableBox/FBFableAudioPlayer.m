//
//  FBMediaPlayer.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBFableAudioPlayer.h"


@interface FBFableAudioPlayer()

@property (strong, atomic) AVAudioPlayer *audioPlayer;

@end


@implementation FBFableAudioPlayer

+ (FBFableAudioPlayer *)sharedSingleton
{
    static FBFableAudioPlayer *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
        {
            sharedSingleton = [[FBFableAudioPlayer alloc] init];
        }
        return sharedSingleton;
    }
}

- (void) setDelegate:(id<AVAudioPlayerDelegate>)delegate
{
    [self.audioPlayer setDelegate:delegate];
}

- (void) playAudio
{
    [self.audioPlayer play];
}

- (void) pauseAudio
{
    [self.audioPlayer pause];
}

- (void) stopAudio
{
    [self.audioPlayer stop];
}

- (void) initAudioPlayerWith:(NSData*)audioData
{
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:audioData error:&error];
    if(error)
    {
        NSLog(@"%@", error);
    }
}

- (float) getAudioDuration
{
    return self.audioPlayer.duration;
}

- (void) setCurrentTime:(float)currentTime
{
    [self.audioPlayer setCurrentTime:currentTime];
}

- (float) getCurrentTime
{
    return [self.audioPlayer currentTime];
}



@end
