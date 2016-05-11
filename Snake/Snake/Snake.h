//
//  Snake.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#pragma once

#import <Foundation/Foundation.h>

@class SnakePiece;

@interface Snake : NSObject{
    NS_ENUM(int, Orientation){
        LEFT = 0,
        UP = 1,
        RIGHT = 2,
        DOWN = 3
    };
}

@property enum Orientation direction;
@property int length;
@property NSMutableArray *snakeQueue;
@property SnakePiece *head;

- (void) initWithDirection:(enum Orientation) dir
                      head:(SnakePiece *)headPiece
                    length:(int) length;

- (void) addPiece;

- (void) moveSnake;

@end
