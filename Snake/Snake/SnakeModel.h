//
//  SnakeModel.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Snake;

@interface SnakeModel : NSObject
    
@property int boardSize;
@property NSMutableArray* gameBoard;
@property Snake* player;

- (void) initGame;

@end
