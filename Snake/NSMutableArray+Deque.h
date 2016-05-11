//
//  NSMutableArray+Deque.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Deque)

- (BOOL) empty;
- (NSUInteger) size;
- (id) front;
- (id) back;
- (void) pushFront:(id)obj;
- (void) pushBack:(id)obj;
- (void) popFront;
- (void) popBack;

@end
