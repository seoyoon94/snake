//
//  NSMutableArray+Queue.h
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)

- (BOOL) empty;
- (NSUInteger) size;
- (id) front;
- (id) back;
- (void) push:(id)obj;
- (void) pop;

@end
