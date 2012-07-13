//
//  GameLevelProtocol.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 12/07/12.
//  Copyright (c) 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameLevelProtocol <NSObject>
-(void) AddBall;
-(void) AddGoal;
-(void) AddObstacles;
@end
