//
//  ContactListener.mm
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 11/07/12.
//  Copyright (c) 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import "ContactListener.h"

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
        case 1:
            // Hover Pad
            // Do nothing, Restitution will take care of it
            break;
        case 2:
            // LConveyor
            force = b2Vec2(-1.0f, 0.0f);
            // body1->ApplyForce(force, body1->GetWorldCenter());
            body1->SetLinearVelocity(force);
            break;
        case 3:
            // RConveyor
            force = b2Vec2(1.0f, 0.0f);
            // body1->ApplyForce(force, body1->GetWorldCenter());
            body1->SetLinearVelocity(force);
            break;
        case 6:
            // Funnel
            force = b2Vec2(0.0f, -20.0f);
            body1->ApplyForce(force, body1->GetWorldCenter());
            break;
        case 10:
            NSLog(@"Level Done");
            break;
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
        case 4:
            // Jump Pad Left
            //velocity = b2Vec2(-20.0f, -1*body1->GetLinearVelocity().y);
            //body1->SetLinearVelocity(velocity);
            break;
        case 5:
            // Jump Pad Right
            //velocity = b2Vec2(20.0f, -1*body1->GetLinearVelocity().y);
            //body1->SetLinearVelocity(velocity);
            break;
        default:
            // NSLog(@"The type in the endContact method was %d", typeOfTheSecondObject);
            break;
    }
}