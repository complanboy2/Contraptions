//
//  InventoryLayer.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "InventoryLayer.h"

@implementation InventoryLayer

-(id) init {
    self = [super init];
    if(self) {
        [self setIsTouchEnabled:YES];
        
        CCSprite* hoverPadSprite = [CCSprite spriteWithFile:@"Icon.png"];
        
        CCMenuItemSprite* hoverpad = [CCMenuItemSprite itemFromNormalSprite:hoverPadSprite selectedSprite:hoverPadSprite target:self selector:@selector(HoverPad)];
        inventoryMenu = [CCMenu menuWithItems:hoverpad, nil];
        [self addChild:inventoryMenu];
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [inventoryMenu setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
        
    }
    return self;
}

-(void) dealloc {
    [inventoryMenu dealloc];
    inventoryMenu = nil;
    
    [super dealloc];
}

-(void)HoverPad {
    [[self parent] AddHoverPad];
}
-(void)ConveyorLeft {
    
}
-(void)ConveyorRight {
    
}
-(void)Funnel {
    
}
-(void)JumpPadLeft {
    
}
-(void)JumpPadRight {
    
}
-(void)MagnetPush {
    
}
-(void)MagnetPull {
    
}
-(void)BackBoard {
    
}

@end
