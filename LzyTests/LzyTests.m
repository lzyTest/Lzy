//
//  LzyTests.m
//  LzyTests
//
//  Created by Nationsky on 4/8/16.
//  Copyright © 2016 Nationsky. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LzyTestCases.h"
#import "LzyTestMethod.h"

@interface LzyTests : LzyTestCases

@end

@implementation LzyTests


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


+ (NSArray *)testCaseData{

    NSDictionary *dataA = [NSDictionary dictionaryWithObjects:@[@"LzyTestMethod",@"PrintA:",@"AAAAAA"] forKeys:@[@"TestClass",@"TestMethod",@"TestData"]];
    NSDictionary *dataB = [NSDictionary dictionaryWithObjects:@[@"LzyTestMethod",@"PrintB:",@"BBBBBB"] forKeys:@[@"TestClass",@"TestMethod",@"TestData"]];
    
    return @[dataA, dataB];
}

/*
<testCase>
    <testClass>LzyTestMethod</testClass>
    <testMethod>PrintA:</testMethod>
    <testData>
        <string>AAAAAA</string>
    </testData>
</testCase>
 
 
 */


//- (void)testPrintA{
//    [LzyTestMethod printA:@"111111"];
//}
//
//- (void)testPrintB{
//    [LzyTestMethod printA:@"222222"];
//}


@end
