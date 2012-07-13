//
//  WelcomeScreen.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "WelcomeScreen.h"
#import "GenericLevelScene.h"
#import "LoadingScene.h"


@implementation WelcomeScreen

-(id) init {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    if( self = [super init]) {
        layer = [[WelcomeScreenLayer alloc] init];
        [self addChild:layer];
        instructionLayer = [[InstructionLayer alloc] init];
        [self addChild:instructionLayer];
        [instructionLayer setVisible:NO];
        [layer initMenu];
    }
    return self;
}

-(void) dealloc {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [layer dealloc];
    layer = nil;
    
    [instructionLayer dealloc];
    instructionLayer = nil;
    
    [super dealloc];
}

-(void) displayInstructions {
    [instructionLayer initDisplayInstructions];
    [self toggleLayers];
}

-(void) toggleLayers {
    BOOL instructionLayerVisible = [instructionLayer visible];
    
    if(instructionLayerVisible) {
        [instructionLayer setVisible:NO];
        [layer setVisible:YES];
    }
    else {
        [instructionLayer setVisible:YES];
        [layer setVisible:NO];
    }
}

-(void) startNewGame {
    NSLog(@"%@ , %@", NSStringFromSelector(_cmd), self);
    // Create a scene of Generic Scene and Replace it with the existing scene
    LoadingScene* loadingScene = [[LoadingScene alloc] initWithLevel:1];
    [[CCDirector sharedDirector] replaceScene:loadingScene];
    
//    GenericLevelScene* newScene = [[GenericLevelScene alloc] init];
//    [[CCDirector sharedDirector] replaceScene:newScene];
    
}

-(void) closeApplication{
    NSLog(@"%@ , %@", NSStringFromSelector(_cmd), self);
}

@end
