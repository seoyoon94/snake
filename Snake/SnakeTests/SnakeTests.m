//
//  SnakeTests.m
//  SnakeTests
//
//  Created by Seoyoon Park on 5/11/16.
//  Copyright © 2016 Seoyoon Park. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "NSMutableArray+Queue.h"

@interface SnakeTests : XCTestCase{
    NSMutableArray *test;
}

@end

@implementation SnakeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    test = [[NSMutableArray alloc] init];
    [test addObject:[NSNumber numberWithInt:0]];
    [test addObject:[NSNumber numberWithInt:1]];
    [test addObject:[NSNumber numberWithInt:2]];
    [test addObject:[NSNumber numberWithInt:3]];
    [test addObject:[NSNumber numberWithInt:4]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [test pop];
    NSNumber *one = [test front];
    XCTAssert([one intValue] == 1);
    [test pop];
    XCTAssert([one intValue] == 1);
    XCTAssert([[test back] intValue] == 4);
    XCTAssert([test empty] == NO);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
