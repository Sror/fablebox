//
//  FBConstants.h
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/7/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#ifdef DEBUG
#define SERVER_HOSTNAME                         @"192.168.1.64"
#define SERVER_PORT                             @"3000"
#else
#define SERVER_HOSTNAME                         @"halilayyildiz.com"
#define SERVER_PORT                             @"3000"
#endif

#define DIR_FABLE_AUDIO                         @"fable/audio"
#define DIR_FABLE_IMAGE_SMALL                   @"fable/image/small"
#define DIR_FABLE_IMAGE_LARGE                   @"fable/image/large"

#define API_HTTP_PREFIX                         @"http://"
#define API_FABLE_LIST                          @"/api/fable/list"
#define API_FABLE_AUDIO                         @"/api/fable/audio"
#define API_FABLE_IMAGE_SMALL                   @"/api/fable/image/small"
#define API_FABLE_IMAGE_LARGE                   @"/api/fable/image/large"
#define API_USER_REGISTER                       @"/api/user/register"
#define API_USER_PURCHASE                       @"/api/user/purchase"

#define PARAM_USER_ID                           @"user_id"
#define PARAM_APPLE_ID                          @"apple_id"
#define PARAM_PUSH_TOKEN                        @"push_id"

#define APP_USER_ID                             @"FBUserId"
#define APP_APPLE_ID                            @"FBAppleId"
#define APP_PUSH_TOKEN                          @"FBPushToken"

#define BGCOLOR                                 0xD0D5DE
#define FGCOLOR                                 0x30AEB3
#define SIDE_VIEW_BG_COLOR                      0x23262B
#define SIDE_VIEW_ETCH_LIGHT_COLOR              0x292D32
#define SIDE_VIEW_ETCH_DARK_COLOR               0x1D1B21

@interface FBConstants : NSObject

@end
