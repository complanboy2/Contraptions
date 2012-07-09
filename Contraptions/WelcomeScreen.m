//
//  WelcomeScreen.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "WelcomeScreen.h"
#import "LoadingScene.h"


@implementation WelcomeScreen
-(id) init {
    
    
    CCMenuItemFont* item1 = [CCMenuItemFont itemFromString:@"New Game" target:self selector:@selector(startNewGame:)];
    CCMenuItemFont* item2 = [CCMenuItemFont itemFromString:@"Instructions" target:self selector:@selector(displayInstructions:)];
    CCMenuItemFont* item3 = [CCMenuItemFont itemFromString:@"Quit" target:self selector:@selector(closeApplication:)];
 
    mainMenu = [CCMenu menuWithItems:item1, item2, item3, nil];
    [self addChild:mainMenu];
    
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    [mainMenu setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
    
    return self;
}

-(void) startNewGame {
    NSLog(@"%@ : %@", NSStringFromSelector(_cmd), self);
    LoadingScene* newScene = [LoadingScene node];
    [[CCDirector sharedDirector] replaceScene:newScene];
}

-(void) displayInstructions {
    NSLog(@"%@ : %@", NSStringFromSelector(_cmd), self);
    // Create a new scene to display the instructions
    
}

-(void) closeApplication {
    NSLog(@"%@ : %@", NSStringFromSelector(_cmd), self);
    // Exit the application
}

@end
