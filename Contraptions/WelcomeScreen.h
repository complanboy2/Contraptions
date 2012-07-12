//
//  WelcomeScreen.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "WelcomeScreenLayer.h"

@interface WelcomeScreen : CCScene {
    WelcomeScreenLayer* layer;
    InstructionLayer* instructionLayer;
}
-(id) init;
-(void) dealloc;

-(void) displayInstructions;
-(void) toggleLayers;

-(void)startNewGame;
-(void)closeApplication;

@end
