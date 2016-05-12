//
//  GameScene.h
//  Snake
//

//  Copyright (c) 2016 Seoyoon Park. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Snake;

@interface GameScene : SKScene

@property (weak, nonatomic) id delegate;
@property CGFloat boardOriginX;
@property CGFloat boardOriginY;
@property CGFloat tileSize;
@property SKSpriteNode *background;

-(void)redrawSnake:(Snake *)model;
-(void)drawFoodAtRow:(int)row
              column:(int)col;

@end
