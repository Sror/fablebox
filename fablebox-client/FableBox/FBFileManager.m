//
//  FBFableFileManager.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/13/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBFileManager.h"

@interface FBFileManager()

- (NSString*) getFilePathForFileDir:(NSString*)fileDir withFableId:(NSString*)fableId;

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

- (NSURL*) getUrlForUrlPath:(NSString*)urlPath withFableId:(NSString*)fableId
{
    NSString *baseUrl = [NSString stringWithFormat:@"http://%@:%@%@", SERVER_HOSTNAME, SERVER_PORT, urlPath];
    NSString *fileUrl = [baseUrl stringByAppendingPathComponent:fableId];
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

- (void)saveFableAudioWithId:(NSString*)fableId downloadedData:(NSData*)downloadedData
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_AUDIO withFableId:fableId];
    [downloadedData writeToFile:filePath atomically:YES];
}

- (void)saveFableImageSmallWithId:(NSString*)fableId downloadedData:(NSData*)downloadedData
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_SMALL withFableId:fableId];
    [downloadedData writeToFile:filePath atomically:YES];
}

- (void)saveFableImageLargeWithId:(NSString*)fableId downloadedData:(NSData*)downloadedData
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_LARGE withFableId:fableId];
    [downloadedData writeToFile:filePath atomically:YES];
}

//- (void)downloadFableImageLargeWithId:(NSString*)fableId onComplete:(void (^) (void))onComplete
//{
//    NSURL *fileUrl = [self getUrlForUrlPath:URL_FABLE_IMAGE_LARGE withFableId:fableId];
//    [[self downloadManager] downloadFileWithUrl:fileUrl andNotify:^(NSData *downloadedData) {
//        if (downloadedData)
//        {
//            NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_LARGE withFableId:fableId];
//            [downloadedData writeToFile:filePath atomically:YES];
//        }
//        onComplete();
//    }];
//}

- (NSData*) loadFableAudioWithId:(NSString*)fableId
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_AUDIO withFableId:fableId];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    return data;
}

- (UIImage*) loadFableImageSmallWithId:(NSString*)fableId
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_SMALL withFableId:fableId];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    UIImage *image = [UIImage imageWithData: data];
    return image;
}

- (UIImage*) loadFableImageLargeWithId:(NSString*)fableId
{
    NSString *filePath = [self getFilePathForFileDir:DIR_FABLE_IMAGE_LARGE withFableId:fableId];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    UIImage *image = [UIImage imageWithData: data];
    return image;
}

@end
