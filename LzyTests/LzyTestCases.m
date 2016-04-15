//
//  LzyTestCases.m
//  Lzy
//
//  Created by Nationsky on 4/14/16.
//  Copyright © 2016 Nationsky. All rights reserved.
//

#import "LzyTestCases.h"
#import "NSObject+performSelector.h"
#import "LzyTestMethod.h"

@implementation LzyTestCases

+ (id)defaultTestSuite {
    
    XCTestSuite *suite = [[XCTestSuite alloc] initWithName:NSStringFromClass(self)];
    if (suite) {
        
        for (NSDictionary *testData in [self testCaseData]) {
            
            [suite addTest:[LzyTestMethod createTestCase:testData]];
        }
    }
    return suite;
}

+ (NSArray *)testCaseData {
    return @[];
}


@end
