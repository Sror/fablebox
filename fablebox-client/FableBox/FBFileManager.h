//
//  FBFableFileManager.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/13/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@interface FBFileManager : NSObject

+ (FBFileManager *) sharedSingleton;

- (NSURL*) getUrlForUrlPath:(NSString*)urlPath withFableId:(NSString*)fableId;

- (void)saveFableAudioWithId:(NSString*)fableId downloadedData:(NSData*)downloadedData;
- (void)saveFableImageSmallWithId:(NSString*)fableId downloadedData:(NSData*)downloadedData;
- (void)saveFableImageLargeWithId:(NSString*)fableId downloadedData:(NSData*)downloadedData;

- (NSData*) loadFableAudioWithId:(NSString*)fableId;
- (UIImage*) loadFableImageSmallWithId:(NSString*)fableId;
- (UIImage*) loadFableImageLargeWithId:(NSString*)fableId;

@end
