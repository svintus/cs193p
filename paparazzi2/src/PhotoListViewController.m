
#import "PhotoListViewController.h"

#import "DataController.h"
#import "Photo.h"
#import "PhotoDetailViewController.h"


@implementation PhotoListViewController

@synthesize contactName;
@synthesize photoListController;

-(id) initWithStyle: (UITableViewStyle) style
            contact: (NSString*) contact

{
  if ((self = [super initWithStyle: style])) 
  {
    contactName = [contact copy];
    photoListController = 
      [[[DataController sharedController] 
          fetchedResultsControllerForEntity: @"Photo"
                              withPredicate: 
                                [NSPredicate 
                                    predicateWithFormat: 
                                        @"author.name like %@", contact]
                             sortDescriptor: 
                                [NSSortDescriptor 
                                    sortDescriptorWithKey: @"name"
                                                ascending: YES]] retain];
  }
  return self;
}

-(void) awakeFromNib
{
  self.contactName = nil;
  self.photoListController = 
      [[DataController sharedController] 
          fetchedResultsControllerForEntity: @"Photo"
                              withPredicate: nil
                             sortDescriptor: 
                                [NSSortDescriptor 
                                    sortDescriptorWithKey: @"name"
                                                ascending: YES]];
}

-(void) viewDetailsForPhoto: (Photo*) photo
{
  [photoDetailViewController release];

  photoDetailViewController = 
      [[PhotoDetailViewController alloc]
          initWithNibName: @"PhotoDetailViewController"
                   bundle: [NSBundle mainBundle]
                    photo: photo];
  [self.navigationController pushViewController: photoDetailViewController
                                       animated: YES];
}

-(void) tableView: (UITableView*) tableView
didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
  [self viewDetailsForPhoto: 
      [self.photoListController objectAtIndexPath: indexPath]];
}

-(UITableViewCell*) tableView: (UITableView*) tableView
        cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
  UITableViewCell* cell = 
      [tableView dequeueReusableCellWithIdentifier: @"PhotoCell"];

  if (!cell) 
  { 
    cell = [[[UITableViewCell alloc] 
                initWithStyle: UITableViewCellStyleDefault
              reuseIdentifier: @"PhotoCell"] 
          autorelease]; 
  }

  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  Photo* photo = [self.photoListController objectAtIndexPath: indexPath];
  cell.textLabel.text = photo.name; 
  cell.imageView.image = [UIImage imageNamed: photo.path];
  return cell;
}

-(NSInteger) tableView: (UITableView*) tableView
 numberOfRowsInSection: (NSInteger) section
{
  NSArray *sections = [self.photoListController sections];
  NSUInteger count = 0;
  if ([sections count]) 
  {
    id <NSFetchedResultsSectionInfo> sectionInfo = 
        [sections objectAtIndex: section];
    count = [sectionInfo numberOfObjects];
  }
  return count;
}

-(void) viewDidLoad
{
  self.title = self.contactName ? 
      [NSString stringWithFormat: @"%@'s Photos", contactName] :
      @"Recents";
}

-(void) viewDidUnload
{
  self.photoListController = nil;
}

-(void) dealloc 
{
  [contactName release];
  [photoListController release];
  [photoDetailViewController release];

  [super dealloc];
}

@end
