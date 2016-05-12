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
            gameTile.position = CGPointMake((tileSize * i) + boardOriginX, boardOriginY + (j * tileSize));
            gameTile.zPosition = 0;
            [background addChild:gameTile];
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [delegate tickTimer:self];
}

-(void)redrawSnake:(Snake *)model{
    //Use SKAction to move each individual spite in the snake to the new location.
    for(SnakePiece *piece in [model snakeQueue]){
        SKSpriteNode *sprite = [piece sprite];
    }
}

-(void)drawFoodAtRow:(int)row column:(int)col{
    SKSpriteNode *food = [[SKSpriteNode alloc] initWithImageNamed:@"food.png"];
    food.size = CGSizeMake(tileSize, tileSize);
    food.position = CGPointMake(boardOriginX + (row * tileSize), boardOriginY + (col * tileSize));
    food.zPosition = 1;
    [background addChild:food];
}

@end
