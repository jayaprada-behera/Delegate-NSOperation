//
//  AppDelegate.m
//  FAQ
//
//  Created by Aravind on 29/01/16.
//  Copyright © 2016 Aravind. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize firstView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.firstView=[[ViewController alloc] initWithNibName:[AppDelegate isAppRunningOnIpad:@"ViewConroller"] bundle:nil];
    self.navigationController=[[UINavigationController alloc] initWithRootViewController:self.firstView];
    self.navigationController.navigationBarHidden=YES;
    self.window.rootViewController=self.navigationController;
    [self.window makeKeyAndVisible];
    
   
    return YES;
}
#pragma mark - Delegate Implementation
+(NSString *)isAppRunningOnIpad:(NSString *)strNib
{
    NSString *strTemp;
    NSString *deviceType = [UIDevice currentDevice].model;
    if ([deviceType hasPrefix:@"iPad"]){
        strTemp=[NSString stringWithFormat:@"%@_iPad",strNib];
    }
    else{
        strTemp=strNib;
    }
    return strTemp;
}

+(BOOL)isiPad
{
    BOOL isCheck=NO;
    NSString *deviceType = [UIDevice currentDevice].model;
    if ([deviceType hasPrefix:@"iPad"]){
        isCheck=YES;
    }
    else{
        isCheck=NO;
    }
    return isCheck;
}
+(BOOL)isiPhone5
{
    BOOL isCheck=NO;
    CGSize result = [[UIScreen mainScreen] bounds].size;
    if(result.height==568){
        isCheck=YES;
    }
    else{
        isCheck=NO;
    }
    return isCheck;
}
+(AppDelegate *)appDelegate
{
    return (AppDelegate*) [[UIApplication sharedApplication] delegate];
}

//+(BOOL)isNetworkReachable
//{
//    BOOL isReturn;
//    Reachability* reachability = [Reachability reachabilityForInternetConnection];
//    
//    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
//    
//    if(remoteHostStatus == NotReachable) {
//        isReturn=NO;
//    }
//    else{
//        isReturn=YES;
//    }
//    return isReturn;
//}

- (BOOL)hasCachedInterstitial:(NSString *)location {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
