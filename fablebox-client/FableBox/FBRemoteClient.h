//
//  FBRemoteClient.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBFableClientProtocol.h"

@interface FBRemoteClient : NSObject <FBRemoteClientProtocol>

+ (FBRemoteClient *)sharedSingleton;

@end
