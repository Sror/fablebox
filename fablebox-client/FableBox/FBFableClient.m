//
//  FBFableClient.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/9/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "AFNetworking.h"
#import "FBFable.h"
#import "FBFableClient.h"

@interface FBFableClient()

- (NSMutableArray *)parseFables:(NSArray *)outagesJSON;
- (NSString *)parseUserId:(NSDictionary *)userJSON;
- (NSString *)getDeviceToken;

@end

@implementation FBFableClient

- (void) getFables:(void (^)(NSMutableArray *fables))onCompleteSend {
    
    // prepare url string
    NSString *urlStr = [NSString stringWithFormat:@"http://%@:%@%@", SERVER_HOSTNAME, SERVER_PORT, API_QUERY_ALL_FABLES];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                
                NSMutableArray *outages = [self parseOutage:JSON];
                onCompleteSend(outages);
            }
            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Outages"
                                                             message:[NSString stringWithFormat:@"%@",error]
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [av show];
            }
     ];
    
    [operation start];
}

- (void) registerUserAndNotify:(void (^)(NSString *userId))onComplete
{
    // prepare url string
    NSString *urlStr = [NSString stringWithFormat:@"http://%@:%@%@", SERVER_HOSTNAME, SERVER_PORT, API_QUERY_REGISTER_USER];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSDictionary *params = @{API_PARAM_PUSH_TOKEN: [self getDeviceToken]};
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:urlStr parameters:params];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
         {
             NSString *userId = [self parseUserId:JSON];
             onComplete(userId);
         }
        failure:^(NSURLRequest *request , NSURLResponse *response , NSError *error , id JSON)
         {
             NSLog(@"User Registration Failed: %@",[error localizedDescription]);
             onComplete(nil);
         }];
    
    [operation start];
}

- (NSMutableArray *)parseOutage:(NSArray *)fablesJSON
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for(NSDictionary *fableJson in fablesJSON)
    {
        FBFable *fable = [[FBFable alloc] init];
        
        [fable setGuid:fableJson[@"id"]];
        [fable setName:fableJson[@"name"]];
        [fable setDateAdded:[FBUtils parseDateTime:fableJson[@"create_date"]]];
        [fable setLengthInSeconds:[fableJson[@"length_in_sec"] integerValue]];
        [fable setIsPaid:[fableJson[@"isPaid"] integerValue]];
        
        [result addObject:fable];
    }
    
    return result;
}

- (NSString *)parseUserId:(NSDictionary *)userJSON
{
    NSInteger userId = [userJSON[@"user_id"] integerValue];
    return [NSString stringWithFormat:@"%d", userId];
}

- (NSString *)getDeviceToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [defaults valueForKey:APP_PUSH_TOKEN];
    if (token == nil) {
        return @"";
    }
    return token;
}

@end
