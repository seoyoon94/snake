//
//  MenuProtocol.h
//  Snake
//
//  Created by Seoyoon Park on 5/12/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#pragma once

#import <Foundation/Foundation.h>
#import "MenuScene.h"

@protocol MenuProtocol <NSObject>

-(void)playButtonPressed:(MenuScene *)scene;

@end
