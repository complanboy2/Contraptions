//
//  GenericLevelLayer.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 09/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "InventoryLayer.h"

#define PTM_RATIO 32

@interface GenericLevelLayer : CCLayer {
    b2World* world;
	GLESDebugDraw *m_debugDraw;
    NSMutableArray* listOfObjects;
    CCSprite* backGround;
    CGPoint defaultPoint;
    CCSprite* selSpriteToMove;
}

-(b2Vec2) toMetres:(CGPoint) point;
-(CGPoint) toPixels:(b2Vec2) vec;

-(void)startSimulation;

-(void) AddBall:(CGPoint) point withSpriteAs:(CCSprite*) ball;
-(void) AddGoal:(CGPoint) point withSpriteAs:(CCSprite*) goal;

-(void)AddHoverPad;
-(void)AddConveyorLeft;
-(void)AddConveyorRight;
-(void)AddFunnel;
-(void)AddJumpPadLeft;
-(void)AddJumpPadRight;
-(void)AddMagnetPush;
-(void)AddMagnetPull;
-(void)AddBackBoard;

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
-(CCSprite*)returnSpriteThatIsTouched:(CGPoint) touchedPoint;
-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;


@end
