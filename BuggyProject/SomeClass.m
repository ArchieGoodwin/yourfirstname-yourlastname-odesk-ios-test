//
//  SomeClass.m
//  BuggyProject
//  Copyright (c) 2014 oDesk Corporation. All rights reserved.
//

#import "SomeClass.h"

@implementation SomeClass

+ (void)printTextInMain:(NSString *)someText {
	dispatch_sync(dispatch_get_main_queue(), ^{
		NSLog(@"%@", someText);
	});
}

@end
