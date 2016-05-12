//
//  NSMutableArray+Deque.m
//  Snake
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import "NSMutableArray+Deque.h"

@implementation NSMutableArray (Deque)

-(BOOL)empty{
    return [self count] == 0 ? YES : NO;
}

-(NSUInteger)size{
    return [self count];
}

-(id)front{
    if([self size] == 0){
        return nil;
    }
    return [self objectAtIndex:0];
}

-(id)back{
    if([self size] == 0){
        return nil;
    }
    return [self lastObject];
}

-(void)pushFront:(id)obj{
    [self insertObject:obj atIndex:0];
}

-(void)pushBack:(id)obj{
    [self addObject:obj];
}

-(void)popFront{
    if([self size] == 0){
        return;
    }
    [self removeObjectAtIndex:0];
}

-(void)popBack{
    if([self size] == 0){
        return;
    }
    [self removeLastObject];
}

@end
