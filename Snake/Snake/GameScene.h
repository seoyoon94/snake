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
@property NSDate *previousTick;
@property NSTimeInterval levelSpeedInMillis;

-(void)startTicking;
-(void)stopTicking;
-(void)drawSnake:(Snake *)model;
-(void)drawAddedPiece:(Snake *)model;
-(void)redrawSnake:(Snake *)model;
-(void)drawFoodAtRow:(int)row
              column:(int)col;

-(CGPoint)generatePositionAtRow:(int)row
                    atColumn:(int)col;

@end
