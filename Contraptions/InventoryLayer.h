//
//  InventoryLayer.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface InventoryLayer : CCLayer {
    CCMenu* inventoryMenu;
    CCSprite* backGroundSprite;
}

-(id)init;

-(void) displayInventory;

@end
