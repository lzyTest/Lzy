//
//  NSObject+performSelector.h
//  Lzy
//
//  Created by Nationsky on 4/12/16.
//  Copyright © 2016 Nationsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (performSelector)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray*)objects;

@end
