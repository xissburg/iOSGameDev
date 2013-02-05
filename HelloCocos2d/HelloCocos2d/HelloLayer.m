//
//  HelloLayer.m
//  HelloCocos2d
//
//  Created by xissburg on 8/7/12.
//  Copyright (c) 2012 xissburg. All rights reserved.
//

#import "HelloLayer.h"

@implementation HelloLayer

+ (CCScene *)scene
{
    CCScene *scene = [CCScene node];
    [scene addChild:[self node]];
    return scene;
}

- (id)init
{
    self = [super init];
    if (self) {
        CGSize winSize = [CCDirector sharedDirector].winSize;

        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello, cocos2d!" fontName:@"Marker Felt" fontSize:48];
        label.position = ccp(winSize.width/2, winSize.height/2 - 190);
        [self addChild:label];
        
        CCSprite *blanka = [CCSprite spriteWithFile:@"BlankaStanding.png"];
        blanka.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:blanka];
    }
    return self;
}

@end
