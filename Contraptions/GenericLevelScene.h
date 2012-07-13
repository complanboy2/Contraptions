//
//  GenericLevel.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GenericLevelLayer.h"
#import "InventoryLayer.h"

@interface GenericLevelScene : CCScene {
    GenericLevelLayer* layer;
    InventoryLayer* inventoryLayer;
    CCMenu* openInventoryMenu;
    CCMenu* startSimulationMenu;
    CCMenu* resetMenu;
    CGSize screenSize;
}

-(void) openInventory;
-(void) setupMenu ;
-(void) AddBall;
-(void) AddGoal;
-(void) AddObstacle;

-(void)AddHoverPad;
-(void)AddConveyorLeft;
-(void)AddConveyorRight;
-(void)AddFunnel;
-(void)AddJumpPadLeft;
-(void)AddJumpPadRight;
-(void)AddMagnetPush;
-(void)AddMagnetPull;
-(void)AddBackBoard;

-(void) toggleLayers;
-(void) startSimulation;
-(void) stopSimulation;

-(void) toggleSimulation;
-(void) resetSimulation;

@end
