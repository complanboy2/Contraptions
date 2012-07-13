//
//  Level2.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 13/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "Level2.h"


@implementation Level2

-(id) init {
    self = [super init];
    if(self) {
        screenSize = [CCDirector sharedDirector].winSize;
        NSLog(@"Screen width %0.2f screen height %0.2f",screenSize.width,screenSize.height);
        
        layer = [[GenericLevelLayer alloc] init];
        inventoryLayer = [[InventoryLayer alloc] init];
        [inventoryLayer setVisible:NO];
        [self addChild:layer z:0 tag:1];
        [self addChild:inventoryLayer z:0 tag:2];
        
        [self setupMenu];
        
        // Display the Ball
        [self AddBall];
        
        // Set the Goal
        [self AddGoal];
        
        // Load the obstacles
        [self AddObstacle];
        NSLog(@"Loading Level 2");
    }
    return self;
}

-(void) dealloc {
    [layer dealloc];
    [inventoryLayer dealloc];
    
    [super dealloc];   
}

-(void) AddBall {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    CCSprite* ballSprite = [CCSprite spriteWithFile:@"ball.png"];
    [layer AddBall:CGPointMake(32, screenSize.height-32) withSpriteAs:ballSprite];
    NSLog(@"Added a Ball to the layer");
    NSLog(@"Level1 Add Ball is called");
}

-(void)AddGoal {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    CCSprite* goalSprite = [CCSprite spriteWithFile:@"cup.png"];
    [layer AddGoal:CGPointMake(screenSize.width-48, (48+16)) withSpriteAs:goalSprite];
}

-(void) AddObstacle {
//    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
//    CCSprite* obstacleSprite = [CCSprite spriteWithFile:@"obstacleBall.png"];
//    [layer AddObstacle:CGPointMake(screenSize.width/2, screenSize.height/2) withSpriteAs:obstacleSprite];
//    NSLog(@"Added an obstacle to the layer");
}
@end
