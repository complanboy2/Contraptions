//
//  GenericLevel.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "GenericLevel.h"

@implementation GenericLevel

-(id) init {
    self = [super init];
    
    if(self) {
        layer = [GenericLevelLayer node];
        [self addChild:layer];
        // Added the layer to the scene
    }
    return self;
}

-(void) dealloc {
    [layer dealloc];
    [inventoryLayer dealloc];
    
    
    [super dealloc];
}
-(void)AddHoverPad {
    [self removeChildByTag:10 cleanup:YES];
}
-(void)AddConveyorLeft {
    
}
-(void)AddConveyorRight {
    
}
-(void)AddFunnel {
    
}
-(void)AddJumpPadLeft {
    
}
-(void)AddJumpPadRight {
    
}
-(void)AddMagnetPush {
    
}
-(void)AddMagnetPull {
    
}
-(void)AddBackBoard {
    
}

-(void) displayInventoryLayer {
    inventoryLayer = [InventoryLayer node];
    [self addChild:inventoryLayer z:10 tag:10];
}
@end
