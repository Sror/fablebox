//
//  FBUtils.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/7/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface FBUtils : NSObject

+ (NSString*)durationBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+ (NSString*)formatDate:(NSDate*)date;
+ (NSDate *)parseDateTime:(NSString *) dateString;

@end
