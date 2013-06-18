//
//  Scene.h
//  Toaster
//
//  Created by edward on 8/14/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Scene : NSManagedObject

@property (nonatomic, retain) NSString * sceneName;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSString * sceneAuthor;
@property (nonatomic, retain) NSDate * modifyDate;
@property (nonatomic, retain) NSString * sceneDescription;
@property (nonatomic, retain) NSSet *sceneData;
@end

@interface Scene (CoreDataGeneratedAccessors)

- (void)addSceneDataObject:(NSManagedObject *)value;
- (void)removeSceneDataObject:(NSManagedObject *)value;
- (void)addSceneData:(NSSet *)values;
- (void)removeSceneData:(NSSet *)values;

@end
