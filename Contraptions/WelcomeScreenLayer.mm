//
//  WelcomeScreenLayer.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "WelcomeScreenLayer.h"


@implementation WelcomeScreenLayer
-(id) init {
    if(self = [super init]) {
        mainMenu = nil;
    }
    return self;
}
-(void) dealloc {

    /*
    [mainMenu dealloc];
     mainMenu = nil;
    */
    [super dealloc];
}

-(void)initMenu {
    CCMenuItemFont* item1 = [CCMenuItemFont itemFromString:@"New Game" target:self.parent selector:@selector(startNewGame)];
    CCMenuItemFont* item2 = [CCMenuItemFont itemFromString:@"Instructions" target:self.parent selector:@selector(displayInstructions)];
    CCMenuItemFont* item3 = [CCMenuItemFont itemFromString:@"Quit" target:self.parent selector:@selector(closeApplication)];
    
    mainMenu = [CCMenu menuWithItems:item1, item2, item3, nil];
    [mainMenu alignItemsVerticallyWithPadding:40];
    [self addChild:mainMenu];
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    [mainMenu setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
}

@end
