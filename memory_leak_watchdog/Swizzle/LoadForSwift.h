//
//  LoadForSwift.h
//  exercise
//
//  Created by Yi.Wang on 2019/6/12.
//  Copyright © 2019 Yi.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoadForSwiftProtocol

+ (void)swiftLoad;

@end


#define ADD_LOAD_FOR_SWIFT(className)\
    @interface className(LoadForSwift)\
    @end\
    @implementation className(LoadForSwift)\
    + (void)load {\
        if ([[self class] respondsToSelector:@selector(swiftLoad)]) {\
            [[self class] swiftLoad];\
        }\
    }\
    @end
