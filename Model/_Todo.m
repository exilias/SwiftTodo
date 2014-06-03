// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Todo.m instead.

#import "_Todo.h"

const struct TodoAttributes TodoAttributes = {
	.timeStamp = @"timeStamp",
	.title = @"title",
};

const struct TodoRelationships TodoRelationships = {
};

const struct TodoFetchedProperties TodoFetchedProperties = {
};

@implementation TodoID
@end

@implementation _Todo

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Todo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Todo" inManagedObjectContext:moc_];
}

- (TodoID*)objectID {
	return (TodoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic timeStamp;






@dynamic title;











@end
