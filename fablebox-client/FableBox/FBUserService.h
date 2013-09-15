//
//  FBUserService.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/15/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//


@interface FBUserService : NSObject

- (void) registerUser:(void (^)(NSString *userId))onComplete;

@end
