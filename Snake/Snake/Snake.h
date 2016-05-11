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
@property int headRow;
@property int headCol;

- (void) initWithDirection:(enum Orientation) dir
                   headRow:(int) row
                headColumn:(int) column
                    length:(int) length;

- (void) addPiece;

@end
