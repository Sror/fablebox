//
//  FBFableFileManager.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/13/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBFileManager.h"

@interface FBFileManager()

- (NSString*) getFilePathForFileDir:(NSString*)fileDir withGuid:(NSString*)fableGuid;

@end

@implementation FBFileManager

+ (FBFileManager *)sharedSingleton
{
    static FBFileManager *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
        {
            sharedSingleton = [[FBFileManager alloc] init];
        }
        return sharedSingleton;
    }
}

- (NSURL*) getUrlForAPI:(NSString*)urlPath withGuid:(NSString*)fableGuid
{
    NSString *baseUrl = [NSString stringWithFormat:@"http://%@:%@%@", SERVER_HOSTNAME, SERVER_PORT, urlPath];
    NSString *fileUrl = [baseUrl stringByAppendingPathComponent:fableGuid];
    NSURL *url = [NSURL URLWithString:fileUrl];
    return url;
}

- (NSString*) getFilePathForFileDir:(NSString*)fileDir withFableId:(NSString*)fableId
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *basePath = [documentsPath stringByAppendingPathComponent:fileDir];
    NSString *filePath = [basePath stringByAppendingPathComponent:fableId];
    
    NSError*    theError = nil; //error setting
    if (![[NSFileManager defaultManager] fileExistsAtPath:basePath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:basePath withIntermediateDirectories:YES attributes:nil error:&theError];
    }    
    
    return filePath;
}

- (void)saveFableAudioWithId:(NSString*)fableGuid downloadedData:(NSData*)downloadedData
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_AUDIO withFableId:fableGuid];
    [downloadedData writeToFile:filePath atomically:YES];
}

- (void)saveFableImageSmallWithId:(NSString*)fableGuid downloadedData:(NSData*)downloadedData
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_SMALL withFableId:fableGuid];
    [downloadedData writeToFile:filePath atomically:YES];
}

- (void)saveFableImageLargeWithId:(NSString*)fableGuid downloadedData:(NSData*)downloadedData
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_LARGE withFableId:fableGuid];
    [downloadedData writeToFile:filePath atomically:YES];
}

- (NSData*) loadFableAudioWithId:(NSString*)fableGuid
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_AUDIO withFableId:fableGuid];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    return data;
}

- (UIImage*) loadFableImageSmallWithId:(NSString*)fableGuid
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_SMALL withFableId:fableGuid];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    UIImage *image = [UIImage imageWithData: data];
    return image;
}

- (UIImage*) loadFableImageLargeWithId:(NSString*)fableGuid
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_LARGE withFableId:fableGuid];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    UIImage *image = [UIImage imageWithData: data];
    return image;
}

@end
