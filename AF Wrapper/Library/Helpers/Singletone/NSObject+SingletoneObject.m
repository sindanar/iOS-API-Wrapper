//
//  NSObject+SingletonObject.m
//
//  Created by Alko on 24/01/14.
//

#import "NSObject+SingletoneObject.h"
#import <objc/runtime.h>

@implementation NSObject (SingletonObject)

+ (instancetype)shared
{
    //TODO: need to test this behaviour
//    // Prevent debugger connection on release builds
//#ifndef DEBUG
//    SEC_IS_BEING_DEBUGGED_RETURN_NIL();
//#endif

    id shared;
    @synchronized (self) {
        shared = objc_getAssociatedObject(self, _cmd);

        if (!shared) {
            shared = [self new];
            [shared prepare];

            [self setShared:shared];
        }
    }
    
    return shared;
}

+ (void)setShared:(id)shared
{
    objc_setAssociatedObject(self, @selector(shared), shared, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)prepare
{
}

@end
