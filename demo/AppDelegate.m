//
//  AppDelegate.m
//  demo
//
//  Created by yangxutao on 17/3/1.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

#import "AppDelegate.h"
#import <FBMemoryProfiler/FBMemoryProfiler.h>
#import <FBAllocationTracker/FBAllocationTrackerManager.h>

@interface AppDelegate ()

@property (nonatomic , strong) FBMemoryProfiler * memoryProfiler;



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    FBMemoryProfiler *memoryProfiler = [FBMemoryProfiler new];
    [memoryProfiler enable];
    
    // Store memory profiler somewhere to extend it's lifetime
    _memoryProfiler = memoryProfiler;
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self notification];
    
    return YES;
}


- (void)notification {
    
    CGFloat versionNum = [[UIDevice currentDevice].systemVersion floatValue];
    if (versionNum >= 8.0) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= _IPHONE80_
        //Types
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        
        //Actions
        UIMutableUserNotificationAction *acceptAction = [[UIMutableUserNotificationAction alloc] init];
        
        acceptAction.identifier = @"ACCEPT_IDENTIFIER";
        acceptAction.title = @"Accept";
        
        acceptAction.activationMode = UIUserNotificationActivationModeForeground;
        acceptAction.destructive = NO;
        acceptAction.authenticationRequired = NO;
        
        //Categories
        UIMutableUserNotificationCategory *inviteCategory = [[UIMutableUserNotificationCategory alloc] init];
        
        inviteCategory.identifier = @"INVITE_CATEGORY";
        
        [inviteCategory setActions:@[acceptAction] forContext:UIUserNotificationActionContextDefault];
        
        [inviteCategory setActions:@[acceptAction] forContext:UIUserNotificationActionContextMinimal];
        
        NSSet *categories = [NSSet setWithObjects:inviteCategory, nil];
        
        
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
#endif

    } else {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    }
    
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString* token = [NSString stringWithFormat:@"%@",deviceToken];
    token=[token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    token=[token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token=[token stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //注册平台的推送
//    if ([[DZUserData sharedInstance] plugcheckGotye]||1) {
//        [[RCIMClient sharedRCIMClient]setDeviceToken:token];
//    }
    
    //把deviceToken发送到我们的推送服务器
//    [[DZInitHelper sharedInstance] registerForRemoteNotifications:token];

}

//注册失败吊用此方法
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //    userInfo 里面是所有的推送消息 其中aps 是系统必须的格式
    //    {
    //        aps =     {
    //            alert = "\U5185\U5bb9";
    //            badge = 1;
    //            sound = default;
    //        };
    //        topicId = 11;
    //        type = Topic;
    //        xg =     {
    //            bid = 48089903;
    //            ts = 1437379050;
    //        };
    //    }

    //处理推送
    
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    NSLog(@"---- scheme : %@",[url scheme]);
    NSLog(@"-------- options  = %@",options);
    
    return YES;
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
//    
//    
//    return YES;
//}


//ios9之前废弃
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    
//    NSLog(@"-----------   %@----------%@",url,sourceApplication);
//    NSLog(@"---- %@",[url scheme]);
//    
//    return YES;
//}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}






@end
