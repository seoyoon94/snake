//
//  NSMutableArray+Queue.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)

- (BOOL) empty{
    return [self count] == 0 ? YES : NO;
}

- (NSUInteger) size{
    return [self count];
}

- (id) front{
    if([self size] == 0){
        return nil;
    }
    return [self objectAtIndex:0];
}

- (id) back{
    if([self size] == 0){
        return nil;
    }
    return [self objectAtIndex:[self size] - 1];
}

- (void) push:(id)obj{
    [self addObject:obj];
}

- (void) pop{
    if([self size] == 0){
        return;
    }
    [self removeObjectAtIndex:0];
}

@end
