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
}

-(void)HoverPad;
-(void)ConveyorLeft;
-(void)ConveyorRight;
-(void)Funnel;
-(void)JumpPadLeft;
-(void)JumpPadRight;
-(void)MagnetPush;
-(void)MagnetPull;
-(void)BackBoard;
@end
