
#import "PersonListViewController.h"

#import "DataController.h"
#import "Person.h"
#import "Photo.h"
#import "PhotoListViewController.h"


@implementation PersonListViewController

@synthesize contactListController;

-(void) viewDidLoad
{
  [super viewDidLoad];

  self.contactListController = 
      [[DataController sharedController]
          fetchedResultsControllerForEntity: @"Person"
                              withPredicate: nil
                             sortDescriptor: 
                                  [NSSortDescriptor 
                                      sortDescriptorWithKey: @"name" 
                                                  ascending: YES]];
}

-(void) viewDidUnload
{
  self.contactListController = nil;
}

-(void) viewPhotosForContact: (NSString*) contact
{
  [photoListViewController release];

  photoListViewController =
    [[PhotoListViewController alloc] 
        initWithStyle: UITableViewStylePlain
              contact: contact];
  [self.navigationController pushViewController: photoListViewController
                                       animated: YES];
}

-(void) tableView: (UITableView*) tableView
didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
  [self viewPhotosForContact: 
      [[self.contactListController objectAtIndexPath: indexPath] name]];
}

-(UITableViewCell*) tableView: (UITableView*) tableView
        cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
  UITableViewCell* cell = 
      [tableView dequeueReusableCellWithIdentifier: @"PersonCell"];

  if (!cell) 
  { 
    cell = [[[UITableViewCell alloc] 
                initWithStyle: UITableViewCellStyleDefault
              reuseIdentifier: @"PersonCell"] 
          autorelease]; 
  }

  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  Person* person = [self.contactListController objectAtIndexPath: indexPath];
  cell.textLabel.text = person.name;
  Photo* firstPhoto = [person.photos anyObject];
  cell.imageView.image = [UIImage imageNamed: firstPhoto.path];
  return cell;
}

-(NSInteger) tableView: (UITableView*) tableView
 numberOfRowsInSection: (NSInteger) section
{
  NSArray *sections = [self.contactListController sections];
  NSUInteger count = 0;
  if ([sections count]) 
  {
    id <NSFetchedResultsSectionInfo> sectionInfo = 
        [sections objectAtIndex: section];
    count = [sectionInfo numberOfObjects];
  }
  return count;
}

-(void) dealloc
{
  [contactListController release];
  [photoListViewController release];

  [super dealloc];
}

@end
