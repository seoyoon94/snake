//
//  Snake.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "Snake.h"

@implementation Snake

@synthesize direction;
@synthesize length;

- (void) initWithDirection:(enum Orientation)dir
                    length:(int)len{
    [self setDirection:dir];
    [self setLength:len];
}

@end
