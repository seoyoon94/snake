//
//  SnakePiece.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#pragma once

#import <Foundation/Foundation.h>
#import "SpriteKit/SpriteKit.h"

@interface SnakePiece : NSObject

@property int row;
@property int col;
@property SKSpriteNode *sprite;

-(void)initWithRow:(int)row
              column:(int)col;
-(void)changeRow:(int)rowIdx
          column:(int)colIdx;
@end
