//
//  GenericLevel.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "GenericLevelScene.h"

@implementation GenericLevelScene

-(id) init {
    self = [super init];
    if(self) {
        
        screenSize = [CCDirector sharedDirector].winSize;
        NSLog(@"Screen width %0.2f screen height %0.2f",screenSize.width,screenSize.height);
        
        layer = [[GenericLevelLayer alloc] init];
        inventoryLayer = [[InventoryLayer alloc] init];
        [inventoryLayer setVisible:NO];
        [self addChild:layer z:0 tag:1];
        [self addChild:inventoryLayer z:-1 tag:2];
        [CCMenuItemFont setFontSize:16];
        CCMenuItemFont* openInventory = [CCMenuItemFont itemFromString:@"Open" target:self selector:@selector(openInventory)];
        openInventoryMenu = [CCMenu menuWithItems:openInventory, nil];
        [self addChild:openInventoryMenu z:0 tag:3];
        [openInventoryMenu setPosition:CGPointMake(screenSize.width - 16, 16)];
        // Added the layer to the scene
        
        CCMenuItemFont* startSimulation = [CCMenuItemFont itemFromString:@"Start"];
        CCMenuItemFont* stopSimulation = [CCMenuItemFont itemFromString:@"Stop"];
        CCMenuItemToggle* startOrStop = [CCMenuItemToggle itemWithTarget:self selector:@selector(toggleSimulation) items:startSimulation, stopSimulation, nil];
        startSimulationMenu = [CCMenu menuWithItems:startOrStop, nil];
        [self addChild:startSimulationMenu];
        [startSimulationMenu setPosition:CGPointMake(screenSize.width -16, screenSize.height - 16)];
        // Added the Start/Stop Button to the screen
        
        // Add the Reset button
        CCMenuItemFont* resetButton = [CCMenuItemFont itemFromString:@"Reset" target:self selector:@selector(resetSimulation)];
        resetMenu = [CCMenu menuWithItems:resetButton, nil];
        [self addChild:resetMenu];
        [resetMenu setPosition:CGPointMake(16, 16)];
        // Display the Ball
        [self AddBall];
        
        // Set the Goal
        [self AddGoal];
    }
    return self;
}

-(void) toggleLayers {
    BOOL inventoryLayerVisible = [inventoryLayer visible];
    BOOL layerVisible = [layer visible];
    
    [inventoryLayer setVisible:inventoryLayerVisible? NO : YES];
    [layer setVisible:layerVisible? NO : YES];
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
}

-(void)AddGoal {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    CCSprite* goalSprite = [CCSprite spriteWithFile:@"cup.png"];
    [layer AddGoal:CGPointMake(screenSize.width-48, (48+16)) withSpriteAs:goalSprite];
}

-(void)AddHoverPad {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddHoverPad];
}

-(void)AddConveyorLeft {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddConveyorLeft];
}
-(void)AddConveyorRight {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddConveyorRight];
}
-(void)AddFunnel {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddFunnel];
}
-(void)AddJumpPadLeft {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddJumpPadLeft];
}
-(void)AddJumpPadRight {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddJumpPadRight];
}
-(void)AddMagnetPush {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddMagnetPush];
}
-(void)AddMagnetPull {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddMagnetPull];
}
-(void)AddBackBoard {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    [self toggleLayers];
    [layer AddBackBoard];
}


-(void) openInventory {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
   // [self addChild:inventoryLayer z:10 tag:10];
    // Bring the background inventory layer to front
    [self toggleLayers];
    [inventoryLayer displayInventory];
}

-(void) startSimulation {
    [layer toggleSimulation];
    [layer startSimulation];
}

-(void) stopSimulation {
    [layer stopSimulation];
}

-(void) toggleSimulation {
    [layer toggleSimulation];
}

-(void) resetSimulation {
    // Remove everything and add the ball and the goal
    [layer destroyAllObjectsInWorld];
    [layer setupBoundaries];
    [self AddBall];
    [self AddGoal];
}
@end
