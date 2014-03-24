//
//  CoreDataHelpers.m
//  BuggyProject
//  Copyright (c) 2014 oDesk Corporation. All rights reserved.
//

#import "CoreDataHelpers.h"
#import "AppDelegate.h"
#import "OwnerEntity.h"
#import "ModelsEntity.h"

@implementation CoreDataHelpers

+ (NSManagedObjectContext *)currentContext {
	AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	return [appDelegate managedObjectContext];
}

+ (BOOL)saveCurrentContext {
	BOOL result = YES;
	
	NSManagedObjectContext *context = [CoreDataHelpers currentContext];
	if ([context hasChanges]) {
		NSError *error = nil;
		result = [context save:&error];
		if (error) {
			NSLog(@"%@", error);
		}
	}
	
	return result;
}

+ (NSFetchRequest *)fetchRequestWithName: (NSString *)name {
	AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	NSManagedObjectModel *mom = appDelegate.managedObjectModel;
	
	NSFetchRequest *result = nil;
	result = [mom fetchRequestTemplateForName:name];
	
	return result;
}

+ (NSArray *)arrayForFetchRequestWithName: (NSString *)name {
	NSFetchRequest *request = [CoreDataHelpers fetchRequestWithName:name];
	NSManagedObjectContext *context = [CoreDataHelpers currentContext];
	
	NSError *error = nil;
	NSArray *result = [context executeFetchRequest:request error:&error];
	if (error) {
		result = [NSArray array];
		NSLog(@"%@", [error localizedFailureReason]);
	}
	
	return result;
}

+ (void)fillUnsortedData {
	NSManagedObjectContext *context = [CoreDataHelpers currentContext];
	
	OwnerEntity *ownerB = [NSEntityDescription insertNewObjectForEntityForName:@"OwnerEntity" inManagedObjectContext:context];
	ownerB.ownerName = @"Owner B";
	
	OwnerEntity *ownerA = [NSEntityDescription insertNewObjectForEntityForName:@"OwnerEntity" inManagedObjectContext:context];
	ownerA.ownerName = @"Owner A";
	
	ModelsEntity *modelB2 = [NSEntityDescription insertNewObjectForEntityForName:@"ModelsEntity" inManagedObjectContext:context];
	modelB2.modelId = @4;
	modelB2.modelName = @"Model B2";
	modelB2.owner = ownerB;
	
	ModelsEntity *modelB1 = [NSEntityDescription insertNewObjectForEntityForName:@"ModelsEntity" inManagedObjectContext:context];
	modelB1.modelId = @3;
	modelB1.modelName = @"Model B1";
	modelB1.owner = ownerB;
	
	ModelsEntity *modelA2 = [NSEntityDescription insertNewObjectForEntityForName:@"ModelsEntity" inManagedObjectContext:context];
	modelA2.modelId = @2;
	modelA2.modelName = @"Model A2";
	modelA2.owner = ownerA;
	
	ModelsEntity *modelA1 = [NSEntityDescription insertNewObjectForEntityForName:@"ModelsEntity" inManagedObjectContext:context];
	modelA1.modelId = @1;
	modelA1.modelName = @"Model A1";
	modelA1.owner = ownerA;
	
	[CoreDataHelpers saveCurrentContext];
}

+ (void)fillSortedData {
	NSManagedObjectContext *context = [CoreDataHelpers currentContext];
	
	OwnerEntity *ownerA = [NSEntityDescription insertNewObjectForEntityForName:@"OwnerEntity" inManagedObjectContext:context];
	ownerA.ownerName = @"Owner A";
	
	OwnerEntity *ownerB = [NSEntityDescription insertNewObjectForEntityForName:@"OwnerEntity" inManagedObjectContext:context];
	ownerB.ownerName = @"Owner B";
	
	ModelsEntity *modelA1 = [NSEntityDescription insertNewObjectForEntityForName:@"ModelsEntity" inManagedObjectContext:context];
	modelA1.modelId = @1;
	modelA1.modelName = @"Model A1";
	modelA1.owner = ownerA;
	
	ModelsEntity *modelA2 = [NSEntityDescription insertNewObjectForEntityForName:@"ModelsEntity" inManagedObjectContext:context];
	modelA2.modelId = @2;
	modelA2.modelName = @"Model A2";
	modelA2.owner = ownerA;
	
	ModelsEntity *modelB1 = [NSEntityDescription insertNewObjectForEntityForName:@"ModelsEntity" inManagedObjectContext:context];
	modelB1.modelId = @3;
	modelB1.modelName = @"Model B1";
	modelB1.owner = ownerB;
	
	ModelsEntity *modelB2 = [NSEntityDescription insertNewObjectForEntityForName:@"ModelsEntity" inManagedObjectContext:context];
	modelB2.modelId = @4;
	modelB2.modelName = @"Model B2";
	modelB2.owner = ownerB;
	
	[CoreDataHelpers saveCurrentContext];
}

+ (void)cleanData {
	//Please do not call this method if there is no data!!!
	
	NSManagedObjectContext *context = [CoreDataHelpers currentContext];
	NSArray *allObjects = [CoreDataHelpers arrayForFetchRequestWithName:@"AllOwners"];
	
	if (allObjects.count==0) {
		@throw [NSException exceptionWithName:@"CleanDataException"
									   reason:@"Please do not call this method if there is no data"
									 userInfo:nil];
	}
	
	for (NSManagedObject *object in allObjects) {
		[context deleteObject:object];
	}
	[CoreDataHelpers saveCurrentContext];
}

@end
