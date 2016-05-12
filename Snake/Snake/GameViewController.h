//
//  GameViewController.h
//  Snake
//

//  Copyright (c) 2016 Seoyoon Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "TimerProtocol.h"
#import "SnakeProtocol.h"
#import "MenuProtocol.h"

@class SnakeModel;
@class GameScene;

@interface GameViewController : UIViewController <TimerProtocol, SnakeProtocol, MenuProtocol>

@property SnakeModel *model;
@property GameScene *gameScene;

@end
