//
//  FBDataProvider.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBFable.h"
#import "FBFableService.h"
#import "FBFableClientProtocol.h"
#import "FBRemoteClient.h"
#import "FBDummyRemoteClient.h"

@interface FBFableService()

@property (strong, nonatomic) id<FBRemoteClientProtocol> remoteClient;

@end

@implementation FBFableService

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

// to avoid setting immutable list
- (void) setFableList:(NSMutableArray *) newList
{
    if (_fableList != newList) {
        _fableList = [newList mutableCopy];
    }
}

- (NSUInteger) fableCountInList
{
    return [self.fableList count];
}

- (FBFable *) objectInListAtIndex:(NSUInteger)theIndex
{
    return [self.fableList objectAtIndex:theIndex];
}

- (void) addFable:(FBFable *)fable
{
    [self.fableList addObject:fable];
}

- (void) reloadFables:(void (^) (void))onComplete
{
    self.fableList = [[NSMutableArray alloc] init];
    [self.remoteClient getFables:^(NSMutableArray *fables){
        for (FBFable *fable in fables)
        {
            [self.fableList addObject:fable];
        }  
        onComplete();
    }];
}

@end
