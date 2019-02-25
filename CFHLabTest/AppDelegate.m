//
//  AppDelegate.m
//  CFHLabTest
//
//  Created by cathaybk0218 on 2019/2/25.
//  Copyright © 2019 cathaybk0218. All rights reserved.
//

#import "AppDelegate.h"
#import "CFHMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CFHMainViewController *mainVC = [[CFHMainViewController alloc] initWithNibName:NSStringFromClass([CFHMainViewController class]) bundle:nil];
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = naVC;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
