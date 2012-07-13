//
//  ContactListener.mm
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 11/07/12.
//  Copyright (c) 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "ContactListener.h"
#import "LoadingScene.h"

void ContactListener::BeginContact(b2Contact* point) {
    // Get the part which is the ball
    b2Body* body1 = point->GetFixtureA()->GetBody();
    b2Body* body2 = point->GetFixtureB()->GetBody();
    
    SpriteWithType* type1 = (SpriteWithType*) body1->GetUserData();
    SpriteWithType* type2 = (SpriteWithType*) body2->GetUserData();
    
    b2Vec2 force;
    
    int typeOfTheSecondObject = [type2 type];
    
    if( [type2 type] == 0) {
        b2Body* tempBody;
        tempBody = body2;
        body2 = body1;
        body1 = tempBody;
        typeOfTheSecondObject = [type1 type];
    }
    // body 1 is the ball
    switch(typeOfTheSecondObject) {
        case LCONVEYOR:
            // LConveyor
            force = b2Vec2(-1.0f, 0.0f);
            // body1->ApplyForce(force, body1->GetWorldCenter());
            body1->SetLinearVelocity(force);
            break;
        case RCONVEYOR:
            // RConveyor
            force = b2Vec2(1.0f, 0.0f);
            // body1->ApplyForce(force, body1->GetWorldCenter());
            body1->SetLinearVelocity(force);
            break;
        case FUNNEL:
            // Funnel
            force = b2Vec2(0.0f, -20.0f);
            body1->ApplyForce(force, body1->GetWorldCenter());
            break;
        case GOAL:
        {
            NSLog(@"Level Done");
            LoadingScene* nextLevel = [[LoadingScene alloc] initWithLevel:2];
            [[CCDirector sharedDirector] replaceScene:nextLevel];
            break;
        }
        case OBSTACLE:
        {
            NSLog(@"Restart the level");
            LoadingScene* nextLevel = [[LoadingScene alloc] initWithLevel:1];
            [[CCDirector sharedDirector] replaceScene:nextLevel];
            break;
        }
        default:
            // NSLog(@"The type in the begincontact method was %d",typeOfTheSecondObject);
            break;
    }
}

void ContactListener::EndContact(b2Contact* point) {
    // Get the part which is the ball
    b2Body* body1 = point->GetFixtureA()->GetBody();
    b2Body* body2 = point->GetFixtureB()->GetBody();
    
    SpriteWithType* type1 = (SpriteWithType*) body1->GetUserData();
    SpriteWithType* type2 = (SpriteWithType*) body2->GetUserData();
    
    b2Vec2 velocity;
    
    int typeOfTheSecondObject = [type2 type];
    
    if( [type2 type] == 0) {
        b2Body* tempBody;
        tempBody = body2;
        body2 = body1;
        body1 = tempBody;
        typeOfTheSecondObject = [type1 type];
    }
    switch (typeOfTheSecondObject) {
        case HOVERPAD:
            // Hover Pad
            // Do nothing, Restitution will take care of it
            
            // Modified to give it an impulse
            // Lets see what happens
            velocity  = b2Vec2(0.0f,14.14f*body1->GetMass());
            body1->ApplyLinearImpulse(velocity, body1->GetWorldCenter());
            break;
        case JUMPPADLEFT:
            // Jump Pad Left
            //velocity = b2Vec2(-20.0f, -1*body1->GetLinearVelocity().y);
            //body1->SetLinearVelocity(velocity);
            break;
        case JUMPPADRIGHT:
            // Jump Pad Right
            //velocity = b2Vec2(20.0f, -1*body1->GetLinearVelocity().y);
            //body1->SetLinearVelocity(velocity);
            break;
        default:
            // NSLog(@"The type in the endContact method was %d", typeOfTheSecondObject);
            break;
    }
}