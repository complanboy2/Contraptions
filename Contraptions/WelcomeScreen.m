//
//  WelcomeScreen.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "WelcomeScreen.h"
#import "LoadingScene.h"


@implementation WelcomeScreen

-(id) init {
    
    if( self = [super init]) {
        layer = [WelcomeScreenLayer node];
        [self addChild:layer];
    }
    return self;
}

-(void) dealloc {
    [layer dealloc];
    layer = nil;
    
    [super dealloc];
}

@end
