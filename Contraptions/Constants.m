//
//  Constants.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 13/07/12.
//  Copyright (c) 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "Constants.h"

@implementation Constants
@synthesize ball, goal, hoverPad, lconveyor, rconveyor, leftJumpPad, rightJumpPad, obstacle, funnel;

-(id) init {
    self = [super init];
    if(self) {
        self.ball = 0;
        self.hoverPad = 1;
        self.lconveyor = 2;
        self.rconveyor = 3;
        self.leftJumpPad = 4;
        self.rightJumpPad = 5;
        self.funnel = 6;
        self.obstacle = 7;
        self.goal = 8;
    }
    return self;
}

-(void) dealloc {
    [super dealloc];
}
@end
