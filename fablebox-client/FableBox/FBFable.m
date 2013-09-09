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
        
        _guid = @"AA00000BBBB";
        _name = name;
        _dateAdded = dateAdded;
        _lengthInSeconds = length;
        _isPaid = isPaid;
        return self;
    }
    return nil;
}

@end
