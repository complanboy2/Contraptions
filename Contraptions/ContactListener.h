//
//  ContactListener.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 11/07/12.
//  Copyright (c) 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#ifndef Contraptions_ContactListener_h
#define Contraptions_ContactListener_h

#define BALL 0
#define HOVERPAD 1
#define LCONVEYOR 2
#define RCONVEYOR 3
#define JUMPPADLEFT 4
#define JUMPPADRIGHT 5
#define FUNNEL 6
#define OBSTACLE 7
#define GOAL 8

#import "cocos2d.h"
#import "SpriteWithType.h"
#import "Box2D.h"

class ContactListener : public b2ContactListener
{
private:
    void BeginContact(b2Contact* point);
    void EndContact(b2Contact* point);
};

#endif
