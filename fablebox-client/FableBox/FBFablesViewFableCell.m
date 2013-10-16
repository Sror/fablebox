//
//  FBFablesViewFableCell.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import <IADownloadManager.h>
#import "FBFileManager.h"
#import "FBFable.h"
#import "FBFablesViewFableCell.h"

@implementation FBFablesViewFableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    const CGRect insetRect = CGRectInset( self.bounds, 6, 4);
//
//    self.contentView.frame = insetRect;
//    self.backgroundView.frame = insetRect;
//    self.selectedBackgroundView.frame = insetRect;
//    self.contentView.backgroundColor = UIColorFromRGB(0xFFFFFF);
//    self.contentView.layer.cornerRadius = 4;
}


- (void) downloadAndSetFableImage:(FBFileManager*)fileManager;
{
//    UIImage *imageSmall = [fileManager loadFableImageSmallWithId:self.fable.guid];
    
    [self.imageSmallLoadingLabel setHidden:NO];
//    if(imageSmall == nil)
//    {
        NSURL *url = [fileManager getUrlForAPI:API_FABLE_IMAGE_SMALL withGuid:self.fable.guid];
        [IADownloadManager downloadItemWithURL:url useCache:YES];
        
        [IADownloadManager attachListenerWithObject:self
         progressBlock:^(float progress, NSURL *url)
         {
             //         self.downloadProgressStatus.text = [NSString stringWithFormat:@"Downloading  %.0lf %%", (progress * 100)];
             //         self.downloadProgressView.progress = progress;
         }
         completionBlock:^(BOOL success, id response)
         {
             NSLog(@"Fable small image download success -> %@", self.fable.guid);
             // save downloaded file, then set imageview
//             [fileManager saveFableImageSmallWithId:self.fable.guid downloadedData:response];
//             if (self.isViewLoaded && self.view.window)
//             {
                 // viewController is visible
             [self.imageSmallLoadingLabel setHidden:YES];
             [self.imageSmall setImage:[UIImage imageWithData: response]];
//             }
         }
        toURL:url];
//    }
//    else
//    {
//        [self.imageSmallLoadingLabel setHidden:YES];
//        [self.imageSmall  setImage:imageSmall];
//    }
    
}

@end
