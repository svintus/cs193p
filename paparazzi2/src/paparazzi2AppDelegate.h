
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface paparazzi2AppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;

    IBOutlet UIViewController* tabBarController;
    IBOutlet UINavigationController* personNavController;
    IBOutlet UINavigationController* photoNavController;
    
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController* tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController* personNavController;
@property (nonatomic, retain) IBOutlet UINavigationController* photoNavController;

@property (nonatomic, retain, readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel* managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;

-(NSString*) applicationDocumentsDirectory;

@end

