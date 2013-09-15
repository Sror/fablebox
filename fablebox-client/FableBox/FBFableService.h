//
//  FBDataProvider.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

@class FBFable;

@interface FBFableService : NSObject

@property (nonatomic, copy) NSMutableArray *fableList;

- (NSUInteger) fableCountInList;
- (FBFable *) objectInListAtIndex:(NSUInteger)index;
- (void) addFable:(FBFable *)fable;

- (void) reloadFables:(void (^) (void))onComplete;

@end
