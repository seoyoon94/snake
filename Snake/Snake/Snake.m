//
//  Snake.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "Snake.h"
#import "SnakePiece.h"
#import "NSMutableArray+Deque.h"

@implementation Snake

@synthesize direction;
@synthesize length;
@synthesize snakeQueue;
@synthesize head;

- (void) initWithDirection:(enum Orientation)dir
                      head:(SnakePiece *)headPiece
                    length:(int)len{
    [self setDirection:dir];
    [self setLength:len];
    [self setHead:headPiece];
    
    snakeQueue = [[NSMutableArray alloc] init];
    
    SnakePiece *piece = [[SnakePiece alloc] init];
    [piece initWithRow:[head row] column:[head col]];
    [snakeQueue pushBack:piece];
}

- (void) addPiece{
    SnakePiece *piece = [[SnakePiece alloc] init];
    switch (direction) {
        case UP:
            [piece initWithRow:([head row] - 1) column:[head col]];
            break;
        case DOWN:
            [piece initWithRow:([head row] + 1) column:[head col]];
            break;
        case LEFT:
            [piece initWithRow:[head row] column:([head col] + 1)];
            break;
        case RIGHT:
            [piece initWithRow:[head row] column:([head col] - 1)];
            break;
        default:
            break;
    }
    [snakeQueue pushFront:piece];
    [self setHead:piece];
}

- (void) moveSnake{
    [snakeQueue popBack];
    [self addPiece];
}

@end
