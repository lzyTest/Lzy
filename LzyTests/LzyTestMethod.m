//
//  LzyTestMethod.m
//  Lzy
//
//  Created by Nationsky on 4/12/16.
//  Copyright © 2016 Nationsky. All rights reserved.
//

#import "LzyTestMethod.h"

@implementation LzyTestMethod

- (void)printA:(NSString *)string{
    NSLog(@"PrintA print string: %@", string);
}

- (void)printB:(NSString *)string{
    NSLog(@"PrintB print string: %@", string);
}

+ (XCTestCase *)createTestCase:(NSDictionary *)testData{
    NSString *className = [testData objectForKey:@"TestClass"];
    NSString *methodName = [testData objectForKey:@"TestMethod"];
    NSString *param = [testData objectForKey:@"TestData"];
    
    Class targetClass = NSClassFromString(className);
    LzyTestMethod *target= [[LzyTestMethod alloc] init];
    NSLog(@"+++++++target: %@",target);
    
    SEL aSelector = NSSelectorFromString(methodName);
    NSLog(@"+++++++aSelector: %@",NSStringFromSelector(aSelector));
    
    //1、创建签名对象
    NSMethodSignature *signature = [LzyTestMethod instanceMethodSignatureForSelector:aSelector];
    NSLog(@"+++++++signature: %@",signature);
    
    //2、判断传入的方法是否存在
    if (signature==nil) {
        //传入的方法不存在 就抛异常
        NSString*info = [NSString stringWithFormat:@"-[%@ %@]:unrecognized selector sent to instance",[self class],NSStringFromSelector(aSelector)];
        @throw [[NSException alloc] initWithName:@"方法没有" reason:info userInfo:nil];
        return nil;
    }
    
    
    //3、、创建NSInvocation对象
    NSInvocation*invocation = [NSInvocation invocationWithMethodSignature:signature];
    //4、保存方法所属的对象
    invocation.target = target;
    invocation.selector = aSelector;
    
    
    //5、设置参数
    /*
     当前如果直接遍历参数数组来设置参数
     如果参数数组元素多余参数个数，那么就会报错
     */
    NSInteger arguments =signature.numberOfArguments-2;
    /*
     如果直接遍历参数的个数，会存在问题
     如果参数的个数大于了参数值的个数，那么数组会越界
     */
    /*
     谁少就遍历谁
     */
    //    NSUInteger objectsCount = objects.count;
    //    NSInteger count = MIN(arguments, objectsCount);
    //    for (int i = 0; i<count; i++) {
    //        NSObject*obj = objects[i];
    //        //处理参数是NULL类型的情况
    //        if ([obj isKindOfClass:[NSNull class]]) {
    //            obj = nil;
    //        }
    //        [invocation setArgument:&obj atIndex:i+2];
    //
    //    }
    //    //6、调用NSinvocation对象
    //    [invocation invoke];
    
    [invocation setArgument:&param atIndex:2];
    [invocation invoke];
    XCTestCase *testCase = [[XCTestCase alloc] initWithInvocation:invocation];
    return testCase;
}

@end
