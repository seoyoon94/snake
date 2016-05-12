//
//  MenuScene.h
//  Snake
//
//  Created by Seoyoon Park on 5/12/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MenuScene : SKScene

@property SKSpriteNode *background;
@property (weak, nonatomic) id delegate;

@end
