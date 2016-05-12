//
//  Food.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#pragma once

#import <Foundation/Foundation.h>
#import "SpriteKit/SpriteKit.h"

@interface Food : NSObject

@property int row;
@property int col;
@property SKSpriteNode *sprite;

-(void)initWithRow:(int)rowIdx
              column:(int)colIdx;

@end
