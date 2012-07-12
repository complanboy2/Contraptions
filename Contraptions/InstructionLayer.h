//
//  InstructionLayer.h
//  Contraptions
//
//  Created by Prabhat Kiran Bharathidhasan on 11/07/12.
//  Copyright 2012 mclaren.kiran@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface InstructionLayer : CCLayer {
    CCLabelTTF* labelForInstructions;
    CCMenu* backMenu;
}
-(void) initDisplayInstructions;
@end
