
#import <UIKit/UIKit.h>

@class Photo;
@class PhotoDetailViewController;

@interface PhotoListViewController : UITableViewController 
{
  NSString* contactName;
  NSFetchedResultsController* photoListController;
  PhotoDetailViewController* photoDetailViewController;
}

@property(nonatomic, copy) NSString* contactName;
@property(nonatomic, retain) NSFetchedResultsController* photoListController;

-(id) initWithStyle: (UITableViewStyle) style
            contact: (NSString*) contact;

@end
