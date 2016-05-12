//
//  GameScene.h
//  Snake
//

//  Copyright (c) 2016 Seoyoon Park. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Snake;
@class Food;

@interface GameScene : SKScene

@property (weak, nonatomic) id delegate;
@property CGFloat boardOriginX;
@property CGFloat boardOriginY;
@property CGFloat tileSize;
@property SKSpriteNode *background;
@property NSDate *previousTick;
@property NSTimeInterval levelSpeedInMillis;

-(void)startTicking;
-(void)stopTicking;
-(void)drawSnake:(Snake *)model;
-(void)drawAddedPiece:(Snake *)model;
-(void)redrawSnake:(Snake *)model;
-(void)drawFood:(Food *)food;
-(void)redrawFood:(Food *)food;

-(CGPoint)generatePositionAtRow:(int)row
                    atColumn:(int)col;

@end
