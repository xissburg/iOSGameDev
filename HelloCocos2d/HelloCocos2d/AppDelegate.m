//
//  AppDelegate.m
//  HelloCocos2d
//
//  Created by xissburg on 8/7/12.
//  Copyright (c) 2012 xissburg. All rights reserved.
//

#import "AppDelegate.h"
#import "HelloLayer.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CCGLView *glView = [CCGLView viewWithFrame:self.window.bounds pixelFormat:kEAGLColorFormatRGB565 depthFormat:0 preserveBackbuffer:NO sharegroup:nil multiSampling:NO numberOfSamples:0];
    
    self.director = (CCDirectorIOS *)[CCDirector sharedDirector];
    self.director.view = glView;
    self.director.wantsFullScreenLayout = YES;
    self.director.displayStats = YES; // Display frames per second (FPS) and seconds per frame (SPF)
    self.director.animationInterval = 1.0/60; // 60 frames per second
    self.director.projection = kCCDirectorProjection2D; // Set 2D orthogonal projection (default is 3D)
    [self.director enableRetinaDisplay:YES]; // Required to render in high resolution on retina displays
    self.director.delegate = self;
    
    [self.director pushScene:[HelloLayer scene]];
    
    self.window.rootViewController = self.director;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [self.director pause]; // Pause while getting a call or something
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self.director stopAnimation]; // Stop the animation loop before moving to the background
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self.director startAnimation]; // Restart the animation when coming back to the foreground
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self.director resume]; // Un-pause the game
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    CC_DIRECTOR_END(); // Perform final cleanup before terminating
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [self.director purgeCachedData]; // Clean caches on memory warning
}

- (void)applicationSignificantTimeChange:(UIApplication *)application
{
    self.director.nextDeltaTimeZero = YES; // Avoid large animation time steps by setting the next to zero on significant time changes
}

#pragma mark - CCDirectorDelegate

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
