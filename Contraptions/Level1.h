//
//  Level1.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 12/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GenericLevelScene.h"
#import "GameLevelProtocol.h"

@interface Level1 : GenericLevelScene <GameLevelProtocol>

-(id) init;
-(void) dealloc;

-(void) AddBall;
-(void) AddObstacle;
-(void) AddGoal;
-(void) loadNextlevel;

@end
