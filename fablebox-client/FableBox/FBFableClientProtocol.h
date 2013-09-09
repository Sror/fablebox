//
//  FBFableClientProtocol.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@protocol FBFableClientProtocol <NSObject>

- (void) getFables:(void (^)(NSMutableArray *fables))onCompleteSend;
- (void) registerUserAndNotify:(void (^)(NSString *userId))onComplete;

@end
