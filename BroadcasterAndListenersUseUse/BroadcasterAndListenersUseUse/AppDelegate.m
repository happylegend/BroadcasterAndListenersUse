//
//  AppDelegate.m
//  BroadcasterAndListenersUseUse
//
//  Created by 紫冬 on 13-8-28.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //使用手动监听者，发送通知的方法
    
    //第一步：创建一个管理者，也即是发送通知者
    NSMutableArray *mArrayObject = [[NSMutableArray alloc] init];
    
    //第二步：创建需要接收通知的对象
    MyObject *mObj1 = [[MyObject alloc] init];
    MyObject *mObj2 = [[MyObject alloc] init];
    
    //第三步：将这些对象添加到管理者中，让管理者发送通知给这些对象
    [mArrayObject addObject:mObj1];
    [mArrayObject addObject:mObj2];
    
    //第四步：管理者集体向它说管理的对象发送通知
    SEL sel = NSSelectorFromString(@"doSomething");
    [mArrayObject makeObjectsPerformSelector:sel];
    /*
     如果带有参数，那么可以使用这个方法
     mArrayObject makeObjectsPerformSelector:<#(SEL)#> withObject:<#(id)#>
     */    
    
    [mArrayObject release];
    mArrayObject = nil;
    
    return YES;
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
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
