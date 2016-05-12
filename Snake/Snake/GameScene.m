//
//  GameScene.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright (c) 2016 Seoyoon Park. All rights reserved.
//

#import "GameScene.h"
#import "Snake.h"
#import "SnakePiece.h"
#import "TimerProtocol.h"

@implementation GameScene

@synthesize delegate;
@synthesize boardOriginX;
@synthesize boardOriginY;
@synthesize tileSize;
@synthesize background;
@synthesize previousTick;
@synthesize levelSpeedInMillis;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.size = CGSizeMake(width, height);
    
    background = [[SKSpriteNode alloc] initWithImageNamed:@"background.png"];
    background.position = CGPointMake(0, 0);
    background.anchorPoint = CGPointMake(0, 0);
    background.size = self.size;
    background.zPosition = -1;
    [self addChild:background];
    
    [self setTileSize:width/12];
    [self setBoardOriginX:tileSize];
    [self setBoardOriginY:height/2 - (5 * tileSize)];
    
    for(int i = 0; i < 11; i++){
        for(int j = 0; j < 11; j++){
            SKSpriteNode *gameTile = [[SKSpriteNode alloc] initWithImageNamed:@"gameTile.png"];
            gameTile.size = CGSizeMake(tileSize, tileSize);
            gameTile.position = [self generatePositionAtRow:i atColumn:j];
            gameTile.zPosition = 0;
            [background addChild:gameTile];
        }
    }
    
    [self setLevelSpeedInMillis:600];
    [self setPreviousTick:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if(previousTick == nil){
        return;
    }
    NSTimeInterval timePassed = previousTick.timeIntervalSinceNow * -1000.0;
    if(timePassed > levelSpeedInMillis){
        previousTick = [NSDate date];
        [delegate tickTimer:self];
    }
}

-(void)startTicking{
    previousTick = [NSDate date];
}

-(void)stopTicking{
    previousTick = nil;
}

-(void)drawSnake:(Snake *)model{
    for(SnakePiece *piece in [model snakeQueue]){
        SKSpriteNode *sprite = [[SKSpriteNode alloc] initWithImageNamed:@"snakePiece.png"];
        sprite.size = CGSizeMake(tileSize, tileSize);
        sprite.position = [self generatePositionAtRow:[piece row] atColumn:[piece col]];
        sprite.zPosition = 1;
        [background addChild:sprite];
        piece.sprite = sprite;
    }
    [self startTicking];
}

-(void)drawAddedPiece:(Snake *)model{
    SKSpriteNode *piece = [[SKSpriteNode alloc] initWithImageNamed:@"snakePiece.png"];
    piece.size = CGSizeMake(tileSize, tileSize);
    piece.position = [self generatePositionAtRow:[[model tail] row] atColumn:[[model tail] col]];
    piece.zPosition = 1;
    [background addChild:piece];
    [[model tail] setSprite:piece];
}

-(void)redrawSnake:(Snake *)model{
    //Use SKAction to move each individual spite in the snake to the new location.
    for(SnakePiece *piece in [model snakeQueue]){
        SKSpriteNode *sprite = [piece sprite];
        CGPoint newLocation = [self generatePositionAtRow:[piece row] atColumn:[piece col]];
        SKAction *moveToAction = [SKAction moveTo:newLocation duration:0.15];
        moveToAction.timingMode = SKActionTimingEaseInEaseOut;
        [sprite runAction:moveToAction];
    }
}

-(void)drawFoodAtRow:(int)row column:(int)col{
    SKSpriteNode *food = [[SKSpriteNode alloc] initWithImageNamed:@"food.png"];
    food.size = CGSizeMake(tileSize, tileSize);
    food.position = [self generatePositionAtRow:row atColumn:col];
    food.zPosition = 1;
    [background addChild:food];
}



/********** Helper functions ************/
-(CGPoint)generatePositionAtRow:(int)row
                    atColumn:(int)col{
    return CGPointMake(boardOriginX + (col * tileSize), boardOriginY + (row * tileSize));
}

@end
