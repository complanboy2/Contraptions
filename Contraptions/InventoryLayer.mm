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
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setIsTouchEnabled:YES];
        backGroundSprite = [CCSprite spriteWithFile:@"backgroundInventory.jpg"];
        [self addChild:backGroundSprite];
        [backGroundSprite setPosition:CGPointMake(size.width/2, size.height/2)];
    }
    return self;
}

-(void) displayInventory {
    NSLog(@"%@, %@",NSStringFromSelector(_cmd), self);
    [CCMenuItemFont setFontSize:32];
    CCMenuItemFont* hoverPad = [CCMenuItemFont itemFromString:@"Hover Pad" target:self.parent selector:@selector(AddHoverPad)];
    NSLog(@"Parent class is %@", NSStringFromClass([self.parent class]));
    CCMenuItemFont* conveyorLeft = [CCMenuItemFont itemFromString:@"L.Conveyor" target:self.parent selector:@selector(AddConveyorLeft)];
    CCMenuItemFont* conveyorRight = [CCMenuItemFont itemFromString:@"R.Conveyor" target:self.parent selector:@selector(AddConveyorRight)];
    CCMenuItemFont* jumpPadLeft = [CCMenuItemFont itemFromString:@"L.Jump Pad" target:self.parent selector:@selector(AddJumpPadLeft)];
    CCMenuItemFont* jumpPadRight = [CCMenuItemFont itemFromString:@"R.Jump Pad" target:self.parent selector:@selector(AddJumpPadRight)];
    
    inventoryMenu = [CCMenu menuWithItems:hoverPad, conveyorLeft, conveyorRight, jumpPadLeft, jumpPadRight, nil];
    [self addChild:inventoryMenu];
    
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    [inventoryMenu setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
    [inventoryMenu alignItemsVerticallyWithPadding:10.0f];
}

-(void) dealloc {
    [inventoryMenu dealloc];
    inventoryMenu = nil;
    
    [super dealloc];
}

@end
