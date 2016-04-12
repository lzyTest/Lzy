//
//  OCSomeSampleTest.m
//  Parameterized Unit Test
//
//  Created by Yalin on 16/4/12.
//  Copyright © 2016年 Brian Coyner. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface OCSomeSampleTest : XCTestCase

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


+ (XCTestSuite *)defaultTestSuite {
    XCTestSuite *testSuite = [XCTestSuite testSuiteWithName: NSStringFromClass(self)];
    
    [self addTestsWithArray:@[@"Brian"] expectedString:@"Brian" toTestSuite:testSuite];
    
    return testSuite;
}

+ (void)addTestsWithArray:(NSArray <NSString *> *)array expectedString:(NSString *)expectedString toTestSuite:(XCTestSuite *)testSuite {
    NSArray <NSInvocation *> *invocations = [self testInvocations];
    
    for (NSInvocation *invocation in invocations) {
        
        OCSomeSampleTest *testCase = [OCSomeSampleTest testCaseWithInvocation:invocation];
        
        testCase.array = array;
        testCase.expectedString = expectedString;
        
        [testSuite addTest:testSuite];
    }
}

- (void)testGeneratedString {
//    NSString *actualString = [self.array reduce]
    NSString *actualString = [self reduceWithArray:self.array];
    XCTAssertEqual(_expectedString, actualString);
}

- (NSString *)reduceWithArray:(NSArray <NSString *> *)array {
   
    NSString *str = @"";
    for (NSString *string in array) {
        [str stringByAppendingString:string];
    }
    
    return str;
}

@end
