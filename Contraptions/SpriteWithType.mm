//
//  SpriteWithType.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 11/07/12.
//  Copyright (c) 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "SpriteWithType.h"

@implementation SpriteWithType
@synthesize image;
@synthesize type;
@synthesize hasBodyAssociated;

-(id)init {
    self = [super init];
    if(self) {
        self.image = nil;
        self.type = 0;
        hasBodyAssociated = NO;
    }
    return self;
}

-(void) dealloc {
    [image dealloc];
    image = nil;
    
    [super dealloc];
}

@end
