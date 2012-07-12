//
//  InstructionLayer.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 11/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "InstructionLayer.h"


@implementation InstructionLayer
-(id) init {
    self = [super init];
    if(self) {
        labelForInstructions = [CCLabelTTF labelWithString:@"Guide the ball to the Cup" fontName:@"Marker Felt" fontSize:24];
        [self addChild:labelForInstructions];
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [labelForInstructions setPosition:CGPointMake(screenSize.width/2, screenSize.height-24)];
        
    }
    return self;
}

-(void) dealloc {
     /*
      [labelForInstructions dealloc];
     labelForInstructions = nil;

     [backMenu dealloc];
     backMenu = nil;
    */
    [super dealloc];
}
    
-(void) initDisplayInstructions {
    [CCMenuItemFont setFontSize:16];
    CCMenuItemFont* back = [CCMenuItemFont itemFromString:@"Back" target:self.parent selector:@selector(toggleLayers)];
    backMenu = [CCMenu menuWithItems:back, nil];
    
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    [backMenu setPosition:CGPointMake(screenSize.width -16 , 16)];
    [self addChild:backMenu];
}
    
@end
