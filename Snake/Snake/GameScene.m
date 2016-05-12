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
#import "Food.h"
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
    
    //Set background where all nodes will go
    background = [[SKSpriteNode alloc] initWithImageNamed:@"background.png"];
    background.position = CGPointMake(0, 0);
    background.anchorPoint = CGPointMake(0, 0);
    background.size = self.size;
    background.zPosition = -1;
    [self addChild:background];
    
    [self setTileSize:width/12];
    [self setBoardOriginX:tileSize];
    [self setBoardOriginY:height/2 - (5 * tileSize)];
    
    //Set up game board
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
    
    //Set up main logo
    SKSpriteNode *logo = [[SKSpriteNode alloc] initWithImageNamed:@"snakeLogo.png"];
    logo.size = CGSizeMake(width/2, width/2);
    logo.position = CGPointMake(width/2, 7 * height/8);
    logo.zPosition = 0;
    [background addChild:logo];
    
    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeoBold"];
    scoreLabel.text = @"0";
    scoreLabel.name = @"score";
    scoreLabel.fontSize = 30;
    scoreLabel.fontColor = [SKColor colorWithRed:70/255.0 green:129/255.0 blue:101/255.0 alpha:1];
    scoreLabel.position = CGPointMake(width/2, boardOriginY - scoreLabel.frame.size.height * 4);
    [background addChild:scoreLabel];
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

-(void)drawFood:(Food *)food{
    SKSpriteNode *tmpFood = [[SKSpriteNode alloc] initWithImageNamed:@"food.png"];
    tmpFood.size = CGSizeMake(tileSize, tileSize);
    tmpFood.position = [self generatePositionAtRow:[food row] atColumn:[food col]];
    tmpFood.zPosition = 0.8;
    [background addChild:tmpFood];
    [food setSprite:tmpFood];
}

-(void)redrawFood:(Food *)food{
    SKSpriteNode *sprite = [food sprite];
    [sprite runAction:[SKAction fadeOutWithDuration:0.2]];
    [sprite runAction:[SKAction scaleBy:0.5 duration:0.2]];
    CGPoint newLocation = [self generatePositionAtRow:[food row] atColumn:[food col]];
    SKAction *moveAction = [SKAction moveTo:newLocation duration:0];
    SKAction *fadeInAction = [SKAction fadeInWithDuration:0.2];
    SKAction *scaleAction = [SKAction scaleBy:2 duration:0.2];
    [sprite runAction:moveAction];
    [sprite runAction:[SKAction sequence:@[fadeInAction, scaleAction]]];
}

-(void)updateScore:(int)score{
    SKLabelNode *labelNode = (SKLabelNode *)[background childNodeWithName:@"score"];
    [labelNode runAction:[SKAction scaleBy:3 duration:0.5]];
    labelNode.text = [NSString stringWithFormat:@"%d", score];
    [labelNode runAction:[SKAction scaleBy:1/3.0 duration:0.5]];
}


/********** Helper functions ************/
-(CGPoint)generatePositionAtRow:(int)row
                    atColumn:(int)col{
    return CGPointMake(boardOriginX + (col * tileSize), boardOriginY + (row * tileSize));
}

@end
