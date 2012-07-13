//
//  LoadingScene.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "LoadingScene.h"
#import "GenericLevelScene.h"
#import "Level1.h"

@interface LoadingSceneLayer : CCLayer {
    
}
@property int level;
-(id) initWithLevel:(int) levelNumber;
@end

@implementation LoadingSceneLayer
@synthesize level;
-(id) initWithLevel:(int)levelNumber {
    self = [super init];
    if(self) {
        [self setIsTouchEnabled:YES];
        CCLabelTTF* loadingLabel = [CCLabelTTF labelWithString:@"Loading..." fontName:@"Marker Felt" fontSize:96];
        [self addChild:loadingLabel];
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [loadingLabel setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
    }
    self.level = levelNumber;
    return self;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // GenericLevelScene* newScene = [[GenericLevelScene alloc] init];
    switch(level) {
        case 1:
        {
            Level1* newScene = [[Level1 alloc] init];
            [[CCDirector sharedDirector] replaceScene:newScene];
            break;
        }
        case 2:
        {
            // Second Level
            break;
        }
        default:
        {
            // All levels done
            break;
        }
    }
}
@end

@implementation LoadingScene

-(id) initWithLevel:(int) levelNumber {
    self = [super init];
    if(self) {
        LoadingSceneLayer* loadingLayer = [[LoadingSceneLayer alloc] initWithLevel: levelNumber];
        [self addChild:loadingLayer];
    }
    return self;
}

-(void) dealloc {
    [super dealloc];
}

@end
