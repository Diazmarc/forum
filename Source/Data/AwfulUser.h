//  AwfulUser.h
//
//  Copyright 2012 Awful Contributors. CC BY-NC-SA 3.0 US https://github.com/Awful/Awful.app

#import "_AwfulUser.h"
@class ProfileParsedInfo;

@interface AwfulUser : _AwfulUser

@property (readonly, nonatomic) NSURL *avatarURL;

+ (instancetype)userCreatedOrUpdatedFromProfileInfo:(ProfileParsedInfo *)profileInfo
                             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

+ (instancetype)firstOrNewUserWithUserID:(NSString *)userID
                  inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
