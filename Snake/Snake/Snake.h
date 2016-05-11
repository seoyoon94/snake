//
//  Snake.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Snake : NSObject{
    NS_ENUM(int, Orientation){
        LEFT = 0,
        UP = 1,
        RIGHT = 2,
        DOWN = 3
    };
}

@property enum Orientation direction;
@property int length;

- (void) initWithDirection:(enum Orientation) dir
                    length:(int) length;

@end
