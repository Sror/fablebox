//
//  FBUserService.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/15/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBRemoteClient.h"
#import "FBUserService.h"

@interface FBUserService()

@property (strong, nonatomic) id<FBRemoteClientProtocol> remoteClient;

@end

@implementation FBUserService

- (id)init
{
    if (self = [super init])
    {
        if(self.remoteClient == nil)
        {
            self.remoteClient = [FBRemoteClient sharedSingleton];
        }
        return self;
    }
    return nil;
}

- (void) registerUser:(void (^)(NSString *userId))onComplete
{
    [[self remoteClient] registerUser:^(NSString *userId) {
        // first try to save user id
        if (userId != nil)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:userId forKey:APP_USER_ID];
            [defaults synchronize];
            NSLog(@"User id saved.");            
        }
        else
        {
            NSLog(@"Unable to create user id !");
        }
        // then notify
        onComplete(userId);
    }];
}

@end
