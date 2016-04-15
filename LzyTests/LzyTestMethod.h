//
//  LzyTestMethod.h
//  Lzy
//
//  Created by Nationsky on 4/12/16.
//  Copyright © 2016 Nationsky. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface LzyTestMethod : NSObject

- (void)printA:(NSString *)string;

- (void)printB:(NSString *)string;

+ (XCTestCase *)createTestCase:(NSDictionary *)testData;

@end
