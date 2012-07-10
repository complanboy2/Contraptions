//
//  GenericLevelLayer.m
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "GenericLevelLayer.h"


@implementation GenericLevelLayer

-(id) init {
    self = [super init];
    if(self) {
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        // Touch is enabled to identify what object is being touched
        [self setIsTouchEnabled:YES];
        
        CCMenuItemFont* openInventory = [CCMenuItemFont itemFromString:@"Open" target:self selector:@selector(openInventory)];
        openInventoryMenu = [CCMenu menuWithItems:openInventory, nil];
        [self addChild:openInventoryMenu];
        [openInventoryMenu setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
        // As of now opening the inventory menu should open the second layer
        b2Vec2 gravity = b2Vec2(0.0f, -10.0f);
        bool doSleep = TRUE;
        world = new b2World(gravity, doSleep);
        // Set the world characteristics
        
        b2BodyDef containerBodyDef;
        b2Body* containerBody = world->CreateBody(&containerBodyDef);
        
        b2PolygonShape containerShape;
        int density = 0;
    
        // The edges of the screen
        float widthInMeters = screenSize.width / PTM_RATIO; 
        float heightInMeters = screenSize.height / PTM_RATIO; 
        b2Vec2 lowerLeftCorner = b2Vec2(0, 0);
        b2Vec2 lowerRightCorner = b2Vec2(widthInMeters, 0); 
        b2Vec2 upperLeftCorner = b2Vec2(0, heightInMeters);
        b2Vec2 upperRightCorner = b2Vec2(widthInMeters, heightInMeters);
        
        // Bottom
        containerShape.SetAsEdge(lowerLeftCorner, lowerRightCorner); 
        containerBody->CreateFixture(&containerShape, density);
        // Top
        containerShape.SetAsEdge(upperLeftCorner, upperRightCorner);
        containerBody->CreateFixture(&containerShape, density);
        // Left side
        containerShape.SetAsEdge(upperLeftCorner, lowerLeftCorner); 
        containerBody->CreateFixture(&containerShape, density);
        // Right side
        containerShape.SetAsEdge(upperRightCorner, lowerRightCorner); 
        containerBody->CreateFixture(&containerShape, density);
        // Added the edges of the Physics World
        
    }
    return self;
}

-(b2Vec2) toMetres:(CGPoint) point {
    b2Vec2 result = b2Vec2(point.x/PTM_RATIO, point.y/PTM_RATIO);
    
    return result;
}

-(CGPoint) toPixels:(b2Vec2)vec {
    return ccpMult(CGPointMake(vec.x,vec.y), PTM_RATIO);
}

-(void) openInventory {
    // Open the Inventory Layer
    // Enable popScene and pushScene
    [[self parent] displayInventoryLayer];
    
}

-(void)dealloc {
    delete world;
    world = NULL;
    
    delete m_debugDraw;
    [listOfObjects dealloc];
    listOfObjects = nil;
    
    [super dealloc];
}

@end
