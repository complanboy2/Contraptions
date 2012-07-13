//
//  Level2.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 13/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GenericLevelScene.h"

@interface Level2 : GenericLevelScene {
    
}
-(id) init;
-(void) dealloc;

-(void) AddBall;
-(void) AddObstacle;
-(void) AddGoal;

@end
