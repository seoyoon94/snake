//
//  SnakePiece.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "SnakePiece.h"

@implementation SnakePiece

@synthesize row;
@synthesize col;
@synthesize sprite;
@synthesize direction;

-(void)initWithRow:(int)rowIdx column:(int)colIdx direction:(enum Orientation)dir{
    [self setRow:rowIdx];
    [self setCol:colIdx];
    [self setSprite:nil];
    [self setDirection:dir];
}

-(void)changeRow:(int)rowIdx column:(int)colIdx direction:(enum Orientation)dir{
    [self setRow:rowIdx];
    [self setCol:colIdx];
}

@end
