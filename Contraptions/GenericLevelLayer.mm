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
        
        backGround = [CCSprite spriteWithFile:@"background.jpg"];
        [self addChild:backGround];
        // As of now opening the inventory menu should open the second layer
        b2Vec2 gravity = b2Vec2(0.0f, -10.0f);
        bool doSleep = TRUE;
        world = new b2World(gravity, doSleep);
        // Set the world characteristics
        
        world->SetContinuousPhysics(true);
		
		// Debug Draw functions
		m_debugDraw = new GLESDebugDraw( PTM_RATIO );
		world->SetDebugDraw(m_debugDraw);
		
		uint32 flags = 0;
		flags += b2DebugDraw::e_shapeBit;
        //		flags += b2DebugDraw::e_jointBit;
        //		flags += b2DebugDraw::e_aabbBit;
        //		flags += b2DebugDraw::e_pairBit;
        //		flags += b2DebugDraw::e_centerOfMassBit;
		m_debugDraw->SetFlags(flags);
        
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
        defaultPoint = CGPointMake(screenSize.width/2, screenSize.height/2);
        
        listOfObjects = [[NSMutableArray alloc] init];
        selSpriteToMove = nil;
        // The simulation has not started yet
    }
    return self;
}

-(void) startSimulation {
    [self schedule:@selector(tick:)];
}

-(void) tick: (ccTime) dt
{
	//It is recommended that a fixed time step is used with Box2D for stability
	//of the simulation, however, we are using a variable time step here.
	//You need to make an informed choice, the following URL is useful
	//http://gafferongames.com/game-physics/fix-your-timestep/
	
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
	
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	world->Step(dt, velocityIterations, positionIterations);
    
	
	//Iterate over the bodies in the physics world
	for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
		if (b->GetUserData() != NULL) {
			//Synchronize the AtlasSprites position and rotation with the corresponding body
			CCSprite *myActor = (CCSprite*)b->GetUserData();
			myActor.position = CGPointMake( b->GetPosition().x * PTM_RATIO, b->GetPosition().y * PTM_RATIO);
			// myActor.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
		}	
	}
}

-(void) draw
{
	// Default GL states: GL_TEXTURE_2D, GL_VERTEX_ARRAY, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
	// Needed states:  GL_VERTEX_ARRAY, 
	// Unneeded states: GL_TEXTURE_2D, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
	glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	
	world->DrawDebugData();
	
	// restore default GL states
	glEnable(GL_TEXTURE_2D);
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    
}

-(b2Vec2) toMetres:(CGPoint) point {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    b2Vec2 result = b2Vec2(point.x/PTM_RATIO, point.y/PTM_RATIO);
    
    return result;
}

-(CGPoint) toPixels:(b2Vec2)vec {
    NSLog(@"%@ : %@",NSStringFromSelector(_cmd), self);
    return ccpMult(CGPointMake(vec.x,vec.y), PTM_RATIO);
}

-(void)dealloc {
    delete world;
    world = NULL;
    
    delete m_debugDraw;
    [listOfObjects dealloc];
    listOfObjects = nil;
    
    [super dealloc];
}

// Add objects to the Physics World

-(void) AddBall:(CGPoint)point withSpriteAs:(CCSprite*) ball{
    // Define the dynamic body.
	//Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(point.x/PTM_RATIO, point.y/PTM_RATIO);
	bodyDef.userData = ball;
	b2Body *body = world->CreateBody(&bodyDef);
	
	// Define another box shape for our dynamic body.
	//b2PolygonShape dynamicBox;
	//dynamicBox.SetAsBox(.5f, .5f);//These are mid points for our 1m box
    b2CircleShape ballShape;
    ballShape.m_radius = 0.5f;
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &ballShape;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
    fixtureDef.restitution = 0.8f;
	body->CreateFixture(&fixtureDef);
   
    ball.position = point;
    [self addChild:ball];

}

-(void) AddGoal:(CGPoint)point withSpriteAs:(CCSprite *)goal {
    b2BodyDef bodyDef;
	// bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(point.x/PTM_RATIO, point.y/PTM_RATIO);
	bodyDef.userData = goal;
	b2Body *body = world->CreateBody(&bodyDef);
	
    // Prabhat Kiran: This is actually a static body. Dont be misled by the variable names
    
	// Define another box shape for our dynamic body.
	b2PolygonShape dynamicBox;
	dynamicBox.SetAsBox(1.0f, 1.0f);//These are mid points for our 1m box
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;	
	fixtureDef.density = 0.0f;
	fixtureDef.friction = 0.3f;
	body->CreateFixture(&fixtureDef);
    
    goal.position = point;
    [self addChild:goal];

}

-(void)AddHoverPad {
    CCSprite* hoverPad = [CCSprite spriteWithFile:@"spring.png"];
    [listOfObjects addObject:hoverPad];
    [self addChild:hoverPad];
    [hoverPad setPosition:defaultPoint];
}
-(void)AddConveyorLeft {
    
}
-(void)AddConveyorRight {
    
}
-(void)AddFunnel {
    
}
-(void)AddJumpPadLeft {
    
}
-(void)AddJumpPadRight {
    
}
-(void)AddMagnetPush {
    
}
-(void)AddMagnetPull {
    
}
-(void)AddBackBoard {
    
}

-(CCSprite*) returnSpriteThatIsTouched:(CGPoint)touchedPoint {
    NSLog(@"%@ ,%@",NSStringFromSelector(_cmd),self);
    NSLog(@"It came here to return the sprite that is being touched");
    for( CCSprite* spriteObject in listOfObjects) {
        if(CGRectContainsPoint(spriteObject.boundingBox, touchedPoint)) {
            return spriteObject;
        }
    }
    return nil;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ , %@",NSStringFromSelector(_cmd), self);
    NSLog(@"It came to the ccTouchesBegan function");
    NSLog(@"Number of touches are %d",[touches count]);
    
    // I dont know why, but it is not calling ccTouchBegan
    // Disable multiple touches as of now.
    NSAssert([touches count]==1, @"Multiple touches have been disabled for now ccTouchesBegan");
    [self ccTouchBegan:[touches anyObject] withEvent:event];
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ , %@",NSStringFromSelector(_cmd), self);
    NSAssert([touches count]==1, @"Multiple touches have been disabled for now ccTouchesMoved");
    [self ccTouchMoved:[touches anyObject] withEvent:event];
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ , %@",NSStringFromSelector(_cmd), self);
    NSAssert([touches count]==1, @"Multiple touches have been disabled for now ccTouchesEnded");
    [self ccTouchMoved:[touches anyObject] withEvent:event];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"%@ ,%@",NSStringFromSelector(_cmd),self);
    NSLog(@"It came here to cTouchBegan");
    selSpriteToMove = [self returnSpriteThatIsTouched:[self convertTouchToNodeSpace:touch]];
    return YES;
}


-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"%@ ,%@",NSStringFromSelector(_cmd),self);
    NSLog(@"The ccTouchMoved method is called");
    CGPoint newPoint = [self convertTouchToNodeSpace:touch];
    if(selSpriteToMove != nil) {
        [selSpriteToMove setPosition:newPoint];
    }
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"%@ ,%@",NSStringFromSelector(_cmd),self);
    selSpriteToMove = nil;
    CGPoint finalPoint = [self convertTouchToNodeSpace:touch];
    NSLog(@"The image was finally placed at (%f,%f)",finalPoint.x,finalPoint.y);
}
@end
