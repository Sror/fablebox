//
//  FBFable.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//


@interface FBFable : NSObject

@property (nonatomic, copy) NSString    *guid;
@property (nonatomic, copy) NSString    *name;
@property (nonatomic, copy) NSDate      *dateAdded;
@property (nonatomic)       NSInteger   lengthInSeconds;
@property (nonatomic)       NSInteger   isPaid;

-(id) initWithName:(NSString *) name dateAdded:(NSDate *) dateAdded lengthInSeconds:(NSInteger)length isPaid:(NSInteger)isPaid;

@end
