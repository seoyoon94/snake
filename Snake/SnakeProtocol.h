//
//  SnakeProtocol.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "SnakeModel.h"

@protocol SnakeProtocol <NSObject>

-(void)snakeDidMove:(SnakeModel *)game;
-(void)snakeAteFood:(SnakeModel *)game;
-(void)gameDidStart:(SnakeModel *)game;
-(void)gameDidEnd:(SnakeModel *)game;
-(void)gameGeneratedFirstFood:(SnakeModel *)game;
-(void)gameGeneratedFood:(SnakeModel *)game;

@end
