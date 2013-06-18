//
//  MasterViewController.h
//  Toaster
//
//  Created by edward on 8/15/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void)updateSceneByChannel:(NSString*) channel routing:(NSString*)routing data:(NSString*)data;
-(void)saveContext;

@end
