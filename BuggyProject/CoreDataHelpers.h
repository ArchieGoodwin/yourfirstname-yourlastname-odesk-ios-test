//
//  CoreDataHelpers.h
//  BuggyProject
//  Copyright (c) 2014 oDesk Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataHelpers : NSObject

+ (NSManagedObjectContext *)currentContext;
+ (BOOL)saveCurrentContext;
+ (NSFetchRequest *)fetchRequestWithName: (NSString *)name;
+ (NSArray *)arrayForFetchRequestWithName: (NSString *)name;

+ (void)fillUnsortedData;
+ (void)fillSortedData;
+ (void)cleanData;

@end
