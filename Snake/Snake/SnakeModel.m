//
//  SnakeModel.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "SnakeModel.h"
#import "Snake.h"
#import "SnakePiece.h"
#import "Food.h"
#include <stdlib.h>

@implementation SnakeModel

@synthesize gameBoard;
@synthesize boardSize;
@synthesize snake;
@synthesize food;

- (void) initGame{
    [self setBoardSize:11];
    
    gameBoard = [[NSMutableArray alloc] initWithCapacity:boardSize];
    for(int i = 0; i < boardSize; i++){
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        for(int j = 0; j < boardSize; j++){
            NSMutableArray *columns = [[NSMutableArray alloc] init];
            [rows addObject:columns];
        }
        [gameBoard addObject:rows];
    }
    
    //Initialize the entire snake with individual pieces.
    //Row will always be half the board size added with half the snake length
    [snake initWithDirection:DOWN headRow:(boardSize/2 + 1) headColumn:boardSize/2 length:3];
    food = [[Food alloc] init];
    [self generateFood];
}

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

@end
