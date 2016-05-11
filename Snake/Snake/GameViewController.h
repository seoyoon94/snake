//
//  GameViewController.h
//  Snake
//

//  Copyright (c) 2016 Seoyoon Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@class SnakeModel;
@class GameScene;

@interface GameViewController : UIViewController

@property SnakeModel *model;
@property GameScene *gameScene;

@end
