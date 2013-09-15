//
//  FBFableFileManager.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/13/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@interface FBFileManager : NSObject

+ (FBFileManager *) sharedSingleton;

- (NSURL*) getUrlForAPI:(NSString*)urlPath withGuid:(NSString*)fableGuid;

- (void)saveFableAudioWithId:(NSString*)fableGuid downloadedData:(NSData*)downloadedData;
- (void)saveFableImageSmallWithId:(NSString*)fableGuid downloadedData:(NSData*)downloadedData;
- (void)saveFableImageLargeWithId:(NSString*)fableGuid downloadedData:(NSData*)downloadedData;

- (NSData*) loadFableAudioWithId:(NSString*)fableGuid;
- (UIImage*) loadFableImageSmallWithId:(NSString*)fableGuid;
- (UIImage*) loadFableImageLargeWithId:(NSString*)fableGuid;

@end
