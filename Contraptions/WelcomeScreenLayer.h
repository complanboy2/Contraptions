//
//  WelcomeScreenLayer.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LoadingScene.h"
#import "InstructionLayer.h"

@interface WelcomeScreenLayer : CCLayer {
    CCMenu* mainMenu;
}

-(id) init;
-(void) dealloc;

-(void) initMenu;

@end
