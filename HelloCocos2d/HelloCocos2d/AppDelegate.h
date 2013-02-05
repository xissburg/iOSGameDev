//
//  AppDelegate.h
//  HelloCocos2d
//
//  Created by xissburg on 8/7/12.
//  Copyright (c) 2012 xissburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, CCDirectorDelegate>

@property (strong, nonatomic) UIWindow *window; 
@property (weak, nonatomic) CCDirectorIOS *director;

@end
