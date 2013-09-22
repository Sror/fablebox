//
//  FBMediaPlayer.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/21/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface FBFableAudioPlayer : NSObject

+ (FBFableAudioPlayer *) sharedSingleton;

- (void) setDelegate:(id)delegate;
- (void) playAudio;
- (void) pauseAudio;
- (void) stopAudio;
- (void) initAudioPlayerWith:(NSData*)audioData;
- (float) getAudioDuration;
- (void) setCurrentTime:(float)currentTime;
- (float) getCurrentTime;

@end
