//
//  LzyTestSuite.m
//  Lzy
//
//  Created by Nationsky on 4/11/16.
//  Copyright © 2016 Nationsky. All rights reserved.
//

#import "LzyTestSuite.h"
#import "NSObject+performSelector.h"

@implementation LzyTestSuite

+(LzyTestSuite *)testSuite{
    LzyTestSuite *suite = [LzyTestSuite defaultTestSuite];
    
    //
    LzyTestMethod *testMethod = [[LzyTestMethod alloc] init];
    NSInvocation *invocationA = [testMethod performSelector:@selector(printA:) withObjects:@[@"AAAAAA"]];
    [suite addTest:[XCTestCase testCaseWithInvocation:invocationA]];
    
    NSInvocation *invocationB = [testMethod performSelector:@selector(printB:) withObjects:@[@"BBBBBB"]];
    [suite addTest:[XCTestCase testCaseWithInvocation:invocationB]];
    //

    return suite;
}


@end
