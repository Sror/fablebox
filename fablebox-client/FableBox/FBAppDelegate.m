//
//  FBAppDelegate.m
//  FableBox
//
//  Created by Halil AYYILDIZ on 9/7/13.
//  Copyright (c) 2013 Halil AYYILDIZ. All rights reserved.
//

#import "FBAppDelegate.h"
#import "MFSideMenuContainerViewController.h"

@implementation FBAppDelegate

- (void) clearNotifications {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    // ask for push notifications
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    // handle push notifications
    if (launchOptions != nil)
    {
        NSDictionary* dictionary = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (dictionary != nil)
        {
            NSLog(@"Launched from push notification: %@", dictionary);
            [self clearNotifications];
        }
    }
    
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // check language
    NSString *lang = [defaults valueForKey:APP_LANG];
    if (lang == nil)
    {
        [defaults setObject:@"English" forKey:APP_LANG];
        [defaults synchronize];
    }
    // check content languages
    NSArray *contentLangs = [defaults valueForKey:APP_CONTENT_LANGS];
    if (contentLangs == nil)
    {
        NSMutableArray *contentLangs = [NSMutableArray arrayWithArray:@[[FBUtils getLangCode:@"English"]]];
        [defaults setObject:contentLangs forKey:APP_CONTENT_LANGS];
        [defaults synchronize];
    }

    
    // set root controller
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"FBFablesNavigationController"];
    UIViewController *sideMenuViewCtrl = [storyboard instantiateViewControllerWithIdentifier:@"FBSideMenuViewController"];
    
    self.container = [MFSideMenuContainerViewController containerWithCenterViewController:navigationController
                                                                   leftMenuViewController:sideMenuViewCtrl
                                                                  rightMenuViewController:nil];
    
    //    [self.container setMenuSlideAnimationEnabled:YES];
    //    [self.container setMenuSlideAnimationFactor:6.0f];
    
    self.window.rootViewController = self.container;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)message
{
    NSLog(@"Received notification: %@", message);
    [self clearNotifications];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [self clearNotifications];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:deviceToken forKey:APP_PUSH_TOKEN];
    [defaults synchronize];
    NSLog(@"Device token is saved");
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil forKey:APP_PUSH_TOKEN];
    [defaults synchronize];
	NSLog(@"Failed to get device token, error: %@", error);
}

@end
