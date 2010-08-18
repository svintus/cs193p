#import <UIKit/UIKit.h>

@class PhotoListViewController;

@interface PersonListViewController : UIViewController 
{
  PhotoListViewController* photoListViewController;
}

-(IBAction) viewFredsPhotos: (id) sender;
-(IBAction) viewBobsPhotos: (id) sender;

@end
