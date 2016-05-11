//
//  Snake.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "Snake.h"
#import "SnakePiece.h"
#import "NSMutableArray+Queue.h"

@implementation Snake

@synthesize direction;
@synthesize length;
@synthesize snakeQueue;
@synthesize headCol;
@synthesize headRow;

- (void) initWithDirection:(enum Orientation)dir
                   headRow:(int)row
                headColumn:(int)column
                    length:(int)len{
    [self setDirection:dir];
    [self setLength:len];
    [self setHeadRow:row];
    [self setHeadCol:column];
    
    snakeQueue = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < len; i++){
        SnakePiece *piece = [[SnakePiece alloc] init];
        [piece initWithRow:(headRow - i) column:headCol];
        [snakeQueue push:piece];
    }
}

- (void) addPiece{
    SnakePiece *piece = [[SnakePiece alloc] init];
    SnakePiece *lastPiece = [snakeQueue back];
    switch (direction) {
        case UP:
            [piece initWithRow:([lastPiece row] + 1) column:[lastPiece col]];
            break;
        case DOWN:
            [piece initWithRow:([lastPiece row] - 1) column:[lastPiece col]];
            break;
        case LEFT:
            [piece initWithRow:[lastPiece row] column:([lastPiece col] + 1)];
            break;
        case RIGHT:
            [piece initWithRow:[lastPiece row] column:([lastPiece col] - 1)];
            break;
        default:
            break;
    }
    [snakeQueue push:piece];
}

@end
