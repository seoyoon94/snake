//
//  TimerProtocol.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameScene.h"

@protocol TimerProtocol <NSObject>

- (void) tickTimer:(GameScene *)scene;

@end
