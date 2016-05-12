//
//  GameViewController.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright (c) 2016 Seoyoon Park. All rights reserved.
//

#import "GameViewController.h"
#import "Snake.h"
#import "GameScene.h"
#import "MenuScene.h"
#import "SnakeModel.h"

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@implementation GameViewController

@synthesize gameScene;
@synthesize model;

-(void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = NO;
    
    // Create and configure the scene.
    MenuScene *menuScene = [[MenuScene alloc] init];
    [menuScene setDelegate:self];
    menuScene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:menuScene];
}
    
-(BOOL)shouldAutorotate
{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

/********** Gesture Recognition *************/
-(void)initGesturesOnView:(SKView *)view{
    UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    
    UISwipeGestureRecognizer* swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    UISwipeGestureRecognizer* swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer* swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [view addGestureRecognizer:swipeDownGestureRecognizer];
    [view addGestureRecognizer:swipeUpGestureRecognizer];
    [view addGestureRecognizer:swipeLeftGestureRecognizer];
    [view addGestureRecognizer:swipeRightGestureRecognizer];
}

/* Change direction of the snake depending on the swipe direction
   The snake cannot change to the polar opposite direction */
-(void)swipeHandler:(UISwipeGestureRecognizer *)sender{
    enum Orientation direction = LEFT;
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionDown:
            if([[model snake] direction] != UP){
                direction = DOWN;
            }
            else{
                direction = UP;
            }
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            if([[model snake] direction] != RIGHT){
                direction = LEFT;
            }
            else{
                direction = RIGHT;
            }
            break;
        case UISwipeGestureRecognizerDirectionRight:
            if([[model snake] direction] != LEFT){
                direction = RIGHT;
            }
            else{
                direction = LEFT;
            }
            break;
        case UISwipeGestureRecognizerDirectionUp:
            if([[model snake] direction] != DOWN){
                direction = UP;
            }
            else{
                direction = DOWN;
            }
        default:
            break;
    }
    
    [[model snake] setDirection:direction];
}

/********** Protocol Implementations ************/
-(void) tickTimer:(GameScene *)scene{
    [model moveSnake];
}

-(void)snakeDidMove:(SnakeModel *)game{
    [gameScene redrawSnake:[game snake]];
}

-(void)snakeAteFood:(SnakeModel *)game{
    [gameScene drawAddedPiece:[game snake]];
}

-(void)gameDidStart:(SnakeModel *)game{
    [gameScene drawSnake:[game snake]];
}

-(void)gameDidEnd:(SnakeModel *)game{
    [gameScene stopTicking];
    MenuScene *menuScene = [[MenuScene alloc] init];
    [menuScene setDelegate:self];
    menuScene.scaleMode = SKSceneScaleModeAspectFill;
    
    SKView *skView = (SKView *)self.view;
    skView.ignoresSiblingOrder = NO;
    SKTransition *sceneTransition = [SKTransition moveInWithDirection:SKTransitionDirectionUp duration:1];
    [skView presentScene:menuScene transition:sceneTransition];
}

-(void)gameGeneratedFirstFood:(SnakeModel *)game{
    [gameScene drawFood:[game food]];
}

-(void)gameGeneratedFood:(SnakeModel *)game{
    [gameScene redrawFood:[game food]];
}

-(void)gameUpdatedScore:(SnakeModel *)game{
    [gameScene updateScore:[game score]];
}

-(void)playButtonPressed:(MenuScene *)scene{
    gameScene = [[GameScene alloc] init];
    [gameScene setDelegate: self];
    gameScene.scaleMode = SKSceneScaleModeAspectFill;
    // Present the scene.
    SKView *skView = (SKView *)self.view;
    skView.ignoresSiblingOrder = NO;
    SKTransition *sceneTransition = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:1];
    [skView presentScene:gameScene transition:sceneTransition];
    
    //Initialize the game
    model = [[SnakeModel alloc] init];
    [model setDelegate:self];
    [model initGame];
    [model startGame];
    
    [self initGesturesOnView:skView];
}


@end
