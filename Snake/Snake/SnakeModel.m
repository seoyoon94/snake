//
//  SnakeModel.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "SnakeModel.h"
#import "Snake.h"

@implementation SnakeModel

@synthesize gameBoard;
@synthesize boardSize;
@synthesize player;

- (void) initGame{
    [self setBoardSize:10];
    
    gameBoard = [[NSMutableArray alloc] initWithCapacity:boardSize];
    for(int i = 0; i < boardSize; i++){
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        for(int j = 0; j < boardSize; j++){
            NSMutableArray *columns = [[NSMutableArray alloc] init];
            [rows addObject:columns];
        }
        [gameBoard addObject:rows];
    }
    
    [player initWithDirection:LEFT length:3];
}

@end
