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
@synthesize tail;

-(void)initWithDirection:(enum Orientation)dir
                      head:(SnakePiece *)headPiece
                    length:(int)len{
    [self setDirection:dir];
    [self setLength:len];
    [self setHead:headPiece];
    [self setTail:headPiece];
    
    snakeQueue = [[NSMutableArray alloc] init];
    
    SnakePiece *piece = [[SnakePiece alloc] init];
    [piece initWithRow:[head row] column:[head col]];
    [snakeQueue pushBack:piece];
}

/* Add a piece to the tail of the snake */
-(void)addPiece{
    SnakePiece *piece = [[SnakePiece alloc] init];
    switch (direction) {
        case UP:
            [piece initWithRow:([tail row] + 1) column:[tail col]];
            break;
        case DOWN:
            [piece initWithRow:([tail row] - 1) column:[tail col]];
            break;
        case LEFT:
            [piece initWithRow:[tail row] column:([tail col] - 1)];
            break;
        case RIGHT:
            [piece initWithRow:[tail row] column:([tail col] + 1)];
            break;
        default:
            break;
    }
    [snakeQueue pushBack:piece];
    [self setTail:piece];
}

/* Move the snake one location forward depending on which direction the snake is moving */
-(void)movePieces{
    for(int i = 0; i < [snakeQueue size]; i++){
        SnakePiece* piece = snakeQueue[i];
        switch (direction) {
            case UP:
                [snakeQueue[i] changeRow:([piece row] - 1) column:[piece col]];
                break;
            case DOWN:
                [snakeQueue[i] changeRow:([piece row] + 1) column:[piece col]];
                break;
            case LEFT:
                [snakeQueue[i] changeRow:[piece row] column:([piece col] + 1)];
                break;
            case RIGHT:
                [snakeQueue[i] changeRow:[piece row] column:([piece col] - 1)];
                break;
            default:
                break;
        }
    }
    [self setHead:[snakeQueue front]];
    [self setTail:[snakeQueue back]];
}

/* Shift the snake back if collision occurs to prevent errors */
-(void)revertPieces{
    [self addPiece];
    [snakeQueue popFront];
    [self setHead:[snakeQueue front]];
}

@end
