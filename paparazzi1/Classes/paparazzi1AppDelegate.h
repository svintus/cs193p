
#import <UIKit/UIKit.h>

@interface paparazzi1AppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow* window;
    IBOutlet UIViewController* tabBarController;
    IBOutlet UINavigationController* personNavController;
    IBOutlet UINavigationController* photoNavController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController* tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController* personNavController;
@property (nonatomic, retain) IBOutlet UINavigationController* photoNavController;

@end

