//
//  SvImageInfoAppDelegate.m
//  SvImgeInfo
//
//  Created by  maple on 6/17/13.
//  Copyright (c) 2013 maple. All rights reserved.
//

#import "SvImageInfoAppDelegate.h"

#import "SvImageInfoViewController.h"
#import "SvImageInfoEditUtils.h"

@implementation SvImageInfoAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[[SvImageInfoViewController alloc] initWithNibName:@"SvImageInfoViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.viewController = [[[SvImageInfoViewController alloc] initWithNibName:@"SvImageInfoViewController_iPad" bundle:nil] autorelease];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"DSC02039" withExtension:@"JPG"];
    
    NSLog(@"%@", NSHomeDirectory());
    
    SvImageInfoEditUtils *editUtils = [[SvImageInfoEditUtils alloc] initWithURL:fileUrl];
    [editUtils setImageOrientation:exifOrientationLeft];
    [editUtils release];
    
    fileUrl = [[NSURL alloc] initFileURLWithPath:[NSString stringWithFormat:@"%@/Documents/DSC02040.JPG", NSHomeDirectory()]];
    SvImageInfoUtils *imageInfoUtils = [[SvImageInfoUtils alloc] initWithURL:fileUrl];
    
    NSLog(@"image size: %d", [imageInfoUtils fileSize]);
    NSLog(@"image type: %@", [imageInfoUtils fileType]);
    NSLog(@"image exif info: %@", [imageInfoUtils exifDictionary]);
    NSLog(@"image tiff info: %@", [imageInfoUtils tiffDictonary]);
    
    [imageInfoUtils release];
    
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
