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

@interface GenericLevel : CCScene {
    GenericLevelLayer* layer;
    InventoryLayer* inventoryLayer;
}

-(void)AddHoverPad;
-(void)AddConveyorLeft;
-(void)AddConveyorRight;
-(void)AddFunnel;
-(void)AddJumpPadLeft;
-(void)AddJumpPadRight;
-(void)AddMagnetPush;
-(void)AddMagnetPull;
-(void)AddBackBoard;

-(void)displayInventoryLayer;

@end
