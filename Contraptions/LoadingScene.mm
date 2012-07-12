//
//  LoadingScene.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "LoadingScene.h"
#import "GenericLevelScene.h"

@interface LoadingSceneLayer : CCLayer {
    
}
@end

@implementation LoadingSceneLayer
-(id) init {
    self = [super init];
    if(self) {
        [self setIsTouchEnabled:YES];
        CCLabelTTF* loadingLabel = [CCLabelTTF labelWithString:@"Loading..." fontName:@"Marker Felt" fontSize:96];
        [self addChild:loadingLabel];
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [loadingLabel setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
    }
    return self;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    GenericLevelScene* newScene = [[GenericLevelScene alloc] init];
    [[CCDirector sharedDirector] replaceScene:newScene];
}
@end

@implementation LoadingScene
-(id) init {
    self = [super init];
    if(self) {
        LoadingSceneLayer* loadingLayer = [LoadingSceneLayer node];
        [self addChild:loadingLayer];
    }
    return self;
}

-(void) dealloc {
    [super dealloc];
}

@end
