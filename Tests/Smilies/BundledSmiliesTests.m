//  BundledSmiliesTests.m
//
//  Copyright 2014 Awful Contributors. CC BY-NC-SA 3.0 US https://github.com/Awful/Awful.app

@import Smilies;
@import XCTest;

@interface BundledSmiliesTests : XCTestCase

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation BundledSmiliesTests

- (NSManagedObjectContext *)managedObjectContext
{
    if (!_managedObjectContext) {
        NSManagedObjectModel *model = [SmilieDataStore managedObjectModel];
        NSPersistentStoreCoordinator *storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        NSDictionary *options = @{NSReadOnlyPersistentStoreOption: @YES};
        NSError *error;
        if (![storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:@"NoMetadata" URL:[SmilieDataStore bundledSmilieStoreURL] options:options error:&error]) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"could not add store" userInfo:nil];
        }
        _managedObjectContext = [NSManagedObjectContext new];
        _managedObjectContext.persistentStoreCoordinator = storeCoordinator;
    }
    return _managedObjectContext;
}

- (void)tearDown
{
    self.managedObjectContext = nil;
    [super tearDown];
}

- (void)testBacktowork
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Smilie entityName]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"text = %@", @":backtowork:"];
    NSError *error;
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    XCTAssert(results.count == 1, @"couldn't find :backtowork:, possible error: %@", error);
    
    Smilie *smilie = results[0];
    XCTAssertEqualObjects(smilie.imageURL.lastPathComponent, @"emot-backtowork.gif");
    XCTAssert(CGSizeEqualToSize(smilie.imageSize, CGSizeMake(38, 25)));
}

@end
