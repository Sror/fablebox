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

#define API_HTTP_PREFIX                         @"http://"
#define API_QUERY_ALL_FABLES                    @"/api/fable/all"
#define API_QUERY_REGISTER_USER                 @"/api/user/register"
#define API_PARAM_PUSH_TOKEN                    @"push_token"

#define APP_USER_ID                             @"FBUserId"
#define APP_PUSH_TOKEN                          @"FBPushToken"

#define BGCOLOR                                 0xD0D5DE
#define FGCOLOR                                 0x30AEB3
#define SIDE_VIEW_BG_COLOR                      0x23262B
#define SIDE_VIEW_ETCH_LIGHT_COLOR              0x292D32
#define SIDE_VIEW_ETCH_DARK_COLOR               0x1D1B21

@interface FBConstants : NSObject

@end
