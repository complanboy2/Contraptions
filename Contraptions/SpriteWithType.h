//
//  SpriteWithType.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 11/07/12.
//  Copyright (c) 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SpriteWithType : NSObject
@property CCSprite* image;
@property int type;
@property BOOL hasBodyAssociated;
@end
