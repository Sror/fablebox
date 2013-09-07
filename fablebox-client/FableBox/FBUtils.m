//
//  FBUtils.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/7/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBUtils.h"

@implementation FBUtils

+ (NSString*)durationBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSTimeInterval distanceBetweenDates = [toDateTime timeIntervalSinceDate:fromDateTime];
    
    NSMutableString* durationString = [NSMutableString string];
    
    [durationString appendString:[NSString stringWithFormat:@"%i", (NSInteger)distanceBetweenDates / 3600 ]];
    [durationString appendString:@" saat "];
    [durationString appendString:[NSString stringWithFormat:@"%i ",((NSInteger)distanceBetweenDates % 3600) / 60]];
    [durationString appendString:@" dakika "];
    
    return durationString;
}

+ (NSString*)formatDate:(NSDate*) date
{
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"dd MMMM YYYY";
    }
    
    return [formatter stringFromDate:date];
}

+ (NSDate *)parseDateTime:(NSString *) dateString
{
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    
    return [formatter dateFromString:dateString];
}

@end
