//
//  OCSomeSampleTest.m
//  Parameterized Unit Test
//
//  Created by Yalin on 16/4/12.
//  Copyright © 2016年 Brian Coyner. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface SampleTest : XCTestCase

@property (nonatomic, strong) NSArray <NSString *> *array;
@property (nonatomic, strong) NSString *expectedString;

@end

@implementation OCSomeSampleTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

+ (XCTestSuite *)defaultTestSuite {
    XCTestSuite *testSuite = [XCTestSuite testSuiteForTestCaseWithName: NSStringFromClass(self)];
    
    [self addTestsWithArray:@[@"Brian"] expectedString:@"Brian" toTestSuite:testSuite];
    
    return testSuite;
}

+ (void)addTestsWithArray:(NSArray <NSString *> *)array expectedString:(NSString *)expectedString toTestSuite:(XCTestSuite *)testSuite {
    NSArray <NSInvocation *> *invocations = [self testInvocations];
    
    for (NSInvocation *invocation in invocations) {
        
        SampleTest *testCase = [SampleTest testCaseWithInvocation:invocation];
        
        testCase.array = array;
        testCase.expectedString = expectedString;
        
        [testSuite addTest:testSuite];
    }
}

- (NSString *)reduce:(NSArray *)array{
    
    NSString *str = @"";
    for (int i=0; i<array.count; i++) {
        str = [str stringByAppendingString:[array objectAtIndex:i]];
    }
    return str;
}

- (void)testGeneratedString {
    NSString *actualString = [self reduce:self.array];
    XCTAssertEqual(actualString, self.expectedString);
}

@end
