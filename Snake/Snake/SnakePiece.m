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

-(void)initWithRow:(int)rowIdx column:(int)colIdx{
    [self setRow:rowIdx];
    [self setCol:colIdx];
}

@end
