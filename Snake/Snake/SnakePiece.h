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
#import "Snake.h"

@interface SnakePiece : NSObject

@property int row;
@property int col;
@property SKSpriteNode *sprite;
@property enum Orientation direction;

-(void)initWithRow:(int)row
              column:(int)col
         direction:(enum Orientation)dir;
-(void)changeRow:(int)rowIdx
          column:(int)colIdx
       direction:(enum Orientation)dir;
@end
