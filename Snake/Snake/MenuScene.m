//
//  MenuScene.m
//  Snake
//
//  Created by Seoyoon Park on 5/12/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "MenuScene.h"
#import "MenuProtocol.h"

@implementation MenuScene

@synthesize background;
@synthesize delegate;

-(void)didMoveToView:(SKView *)view {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.size = CGSizeMake(width, height);
    
    background = [[SKSpriteNode alloc] initWithImageNamed:@"background.png"];
    background.position = CGPointMake(0, 0);
    background.anchorPoint = CGPointMake(0, 0);
    background.size = self.size;
    background.zPosition = -1;
    [self addChild:background];

    
    SKSpriteNode *logo = [[SKSpriteNode alloc] initWithImageNamed:@"snakeLogo.png"];
    logo.size = CGSizeMake(width/2, width/2);
    logo.position = CGPointMake(width/2, height/2 + logo.size.height);
    logo.zPosition = 0;
    [background addChild:logo];
    
    SKSpriteNode *playButton = [[SKSpriteNode alloc] initWithImageNamed:@"playButton.png"];
    playButton.name = @"play";
    CGFloat aspectRatio = 452.0/214.0;
    CGFloat buttonWidth = width/3;
    CGFloat buttonHeight = buttonWidth/aspectRatio;
    playButton.size = CGSizeMake(buttonWidth, buttonHeight);
    playButton.position = CGPointMake(width/2, height/2 - playButton.size.height);
    logo.zPosition = 0;
    [background addChild:playButton];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"play"]) {
        [delegate playButtonPressed:self];
    }
}

@end
