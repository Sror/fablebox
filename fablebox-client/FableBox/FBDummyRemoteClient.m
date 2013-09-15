//
//  FBDummyRemoteClient.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBFable.h"
#import "FBDummyRemoteClient.h"

@implementation FBDummyRemoteClient

- (void) getFables:(void (^)(NSMutableArray *fables))onCompleteSend;
{
    static int counter = 1;
    
    NSMutableArray *newFableList = [[NSMutableArray alloc] init];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    FBFable *fable1 = [[FBFable alloc] initWithName:@"Pamuk Prenses ve Yedi Cüceler" dateAdded:[dateFormatter  dateFromString:@"2013-09-02 09:00:00"] lengthInSeconds:234 isPaid:0];
    FBFable *fable2 = [[FBFable alloc] initWithName:@"Kırmızı Başlıklı Kız" dateAdded:[dateFormatter dateFromString:@"2013-09-04 14:00:00"] lengthInSeconds:260 isPaid:0];
    
    for (int i=0; i<counter; i++)
    {
        if(i%2)
        {
            [newFableList addObject:fable1];
        }else
        {
            [newFableList addObject:fable2];
        }
    }
    
    counter++;
    
    onCompleteSend(newFableList);
}

- (void) registerUser:(void (^)(NSString *userId))onComplete;
{
    //TODO
    
}

@end
