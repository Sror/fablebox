//
//  FBFableDataProvider.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBFable.h"
#import "FBFableDataProvider.h"
#import "FBFableClientProtocol.h"
#import "FBFableClient.h"

@interface FBFableDataProvider()

@property () id<FBFableClientProtocol> fableClient;

@end

@implementation FBFableDataProvider

- (id)init
{
    if (self = [super init])
    {
        if(self.fableClient == nil)
        {
            self.fableClient = [[FBFableClient alloc] init];
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

- (void) reloadFablesAndNotify:(void (^) (void))onComplete
{
    self.fableList = [[NSMutableArray alloc] init];
    [self.fableClient getFables:^(NSMutableArray *fables) {
        for (FBFable *fable in fables) {
            [self.fableList addObject:fable];
        }
        
        onComplete();
    }];
}


@end
