#import <UIKit/UIKit.h>

@class PhotoListViewController;

@interface PersonListViewController : UITableViewController 
<UITableViewDataSource> 
{
  PhotoListViewController* photoListViewController;
  NSFetchedResultsController* contactListController;
}

@property(nonatomic, retain) NSFetchedResultsController* contactListController;


@end
