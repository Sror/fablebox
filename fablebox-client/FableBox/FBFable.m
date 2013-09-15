//
//  FBFable.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBFable.h"

@implementation FBFable

- (id) initWithName:(NSString *)name dateAdded:(NSDate *)dateAdded lengthInSeconds:(NSInteger)length isPaid:(NSInteger)isPaid
{
    self = [super init];
    
    if (self) {
        // TODO
        
        _guid = @"100100";
        _name = name;
        _dateAdded = dateAdded;
        _lengthInSeconds = length;
        _isPaid = isPaid;
        return self;
    }
    return nil;
}

- (NSString*) formattedLength
{
    NSInteger min = self.lengthInSeconds / 60;
    NSInteger sec = self.lengthInSeconds % 60;
    
    NSString *minStr = [NSString stringWithFormat:(min >= 10 ? @"%d" : @"0%d"), min];
    NSString *secStr = [NSString stringWithFormat:(sec >= 10 ? @"%d" : @"0%d"), sec];
    
    return [NSString stringWithFormat:@"%@:%@", minStr, secStr];
}

@end
