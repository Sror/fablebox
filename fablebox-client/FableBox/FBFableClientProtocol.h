//
//  FBRemoteClientProtocol.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@protocol FBRemoteClientProtocol <NSObject>

- (void) getFables:(void (^)(NSMutableArray *fables))onCompleteSend;
- (void) registerUser:(void (^)(NSString *userId))onComplete;

@end
