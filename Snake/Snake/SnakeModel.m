//
//  SnakeModel.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "SnakeModel.h"
#import "Food.h"
#import "SnakePiece.h"
#import "Snake.h"
#import "SnakeProtocol.h"
#include <stdlib.h>

@implementation SnakeModel

@synthesize gameBoard;
@synthesize boardSize;
@synthesize snake;
@synthesize food;
@synthesize delegate;

- (void) initGame{
    [self setBoardSize:11];
    
    gameBoard = [[NSMutableArray alloc] initWithCapacity:boardSize];
    for(int i = 0; i < boardSize; i++){
        NSMutableArray *column = [[NSMutableArray alloc] initWithCapacity:boardSize];
        for(int j = 0; j < boardSize; j++){
            [column addObject:[NSNull null]];
        }
        [gameBoard addObject:column];
    }
    
    //Initialize the entire snake with individual pieces.
    //Row will always be half the board size added with half the snake length
    SnakePiece *head = [[SnakePiece alloc] init];
    [head initWithRow:(boardSize/2 + 1) column:boardSize/2];
    [snake initWithDirection:DOWN head:head length:3];
    for(int i = 0; i < [snake length] - 1; i++){
        [snake addPiece];
    }
    for(SnakePiece *piece in [snake snakeQueue]){
        gameBoard[[piece row]][[piece col]] = piece;
    }
    
    //Add the snake food onto the board
    food = [[Food alloc] init];
    [self generateFood];
}

/* Generates the snake food randomly on the board */
- (void) generateFood{
    int row = arc4random_uniform(boardSize);
    int column = arc4random_uniform(boardSize);
    
    for(SnakePiece *temp in [snake snakeQueue]){
        while([temp row] == row){
            row = arc4random_uniform(boardSize);
        }
        while([temp col] == column){
            column = arc4random_uniform(boardSize);
        }
    }
    [food initWithRow:row column:column];
    gameBoard[row][column] = food;
}

/* Move the snake each time the timer ticks. If the snake collides, then end game */
- (void) moveSnake{
    SnakePiece *tail = [[SnakePiece alloc] init];
    [tail initWithRow:[[snake tail] row] column:[[snake tail] col]];
    [snake movePieces];
    if(![self validMove]){
        [snake revertPieces];
        [self endGame];
    }
    else{
        if([gameBoard[[[snake head] row]][[[snake head] col]] isKindOfClass:[Food class]]){
            
        }
        gameBoard[[tail row]][[tail col]] = [NSNull null];
        gameBoard[[[snake head] row]][[[snake head] col]] = [snake head];
        [delegate snakeDidMove:self];
    }
}

/* Determine if snake has collided with bounds or itself */
- (BOOL) validMove{
    //Check to see if snake moved out of bounds
    if([[snake head] row] < 0 || [[snake head] row] >= boardSize
       || [[snake head] col] < 0 || [[snake head] col] >= boardSize){
        return NO;
    }
    //Check to see if snake collided with itself
    else if(gameBoard[[[snake head] row]][[[snake head] col]] != nil){
        if(![gameBoard[[[snake head] row]][[[snake head] col]] isKindOfClass:[Food class]]){
            return NO;
        }
    }
    return YES;
}

/* End the game and reset the game */
- (void) endGame{
    [delegate gameDidEnd:self];
}

@end
