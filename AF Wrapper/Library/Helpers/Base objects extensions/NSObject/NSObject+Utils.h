//
//  NSObject+Utils.h
//  Test
//
//  Created by Alexander Kozin on 5/2/12.
//  Copyright (c) 2012 Cookie. All rights reserved.
//

@interface NSObject (Utils)

+ (id)object;
+ (id)controllerFromXib;
+ (id)objectFromXib;

@end

@interface NSObject (Notifications)

- (void)addNotificationObserver:(NSString*)name;
- (void)addNotificationObserver:(NSString*)name selector:(SEL)selector;

- (void)addMemoryWarningObserver;
- (void)applicationDidReceiveMemoryWarning:(NSNotification*)n;

- (void)removeNotificationObservers;

- (void)postNotification:(NSString*)name;
- (void)postNotification:(NSString*)name withInfo:(NSDictionary*)info;


- (void)addKeyboardWillShowNotificationObserver;
- (void)addKeyboardWillHideNotificationObserver;

- (void)keyboardWillShow:(NSNotification*)notification;
- (void)keyboardWillHide:(NSNotification*)notification;

@end

@interface NSObject (Observers)

- (void)addObserverForNewValueOf:(NSString*)keyPath;
- (void)removeObserverFor:(NSString*)keyPath;

@end
