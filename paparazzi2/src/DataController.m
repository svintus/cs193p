#import "DataController.h"
#import "Person.h"
#import "Photo.h"
#import "prefs.h"

static NSString* plistPath = @"data/FakeData.plist";

@implementation DataController

@synthesize managedObjectContext;

+(DataController*) sharedController
{
  static DataController* sc = nil;
  return sc ? : (sc = [[DataController alloc] init]);
}

-(id) init
{
  if ((self = [super init]))
  {
    managedObjectContext = 
        [[[[UIApplication sharedApplication] delegate] 
            performSelector: @selector(managedObjectContext)] retain];
  }
    
  return self;
}

static NSString* bundle_path(NSString* path)
{
  return [[[NSBundle mainBundle] bundlePath]
            stringByAppendingPathComponent: path];
}

-(void) loadDataFromPlist
{
  // file name and location
  NSArray* data = [NSArray arrayWithContentsOfFile: bundle_path(plistPath)];
  NSMutableDictionary* authors = [NSMutableDictionary dictionary];

  for(NSString* author in 
      [NSSet setWithArray: [data valueForKey: @"user"]])
  {
    Person* person = (Person*) 
        [NSEntityDescription 
            insertNewObjectForEntityForName: @"Person"
                     inManagedObjectContext: self.managedObjectContext];
    person.name = author;
    [authors setObject: person forKey: person.name];
  }

  for(NSDictionary* photoDict in data)
  {
    Photo* photo = (Photo*) 
        [NSEntityDescription 
            insertNewObjectForEntityForName: @"Photo"
                     inManagedObjectContext: self.managedObjectContext];
    photo.name = [photoDict valueForKey: @"name"];
    photo.path = [photoDict valueForKey: @"path"];
    photo.author = [authors valueForKey: [photoDict valueForKey: @"user"]];
  }

  NSError *error;
  if (![managedObjectContext save: &error]) 
  {
    NSLog(@">>> Error while saving managed context: %@", error);
  }
}

-(NSFetchRequest*) makeFetchRequestForEntity: (NSString*) entityName
                               withPredicate: (NSPredicate*) predicate
                              sortDescriptor: (NSSortDescriptor*) sortDescriptor
{
  if (!get_pref_bool(@"didImportData"))
  {
    [self loadDataFromPlist];
    set_pref_bool(@"didImportData", YES);
    sync_prefs();
  }

	NSEntityDescription* entity = 
      [NSEntityDescription entityForName: entityName 
                  inManagedObjectContext: self.managedObjectContext];
	
	NSFetchRequest* request = [NSFetchRequest new];
	request.entity = entity;
  request.predicate = predicate;
  if (sortDescriptor)
    request.sortDescriptors = [NSArray arrayWithObject: sortDescriptor];
    
  return [request autorelease];
}

-(NSArray*) fetchManagedObjectsForEntity: (NSString*) entityName
                           withPredicate: (NSPredicate*) predicate
{
  NSFetchRequest* request = [self makeFetchRequestForEntity: entityName
                                              withPredicate: predicate
                                             sortDescriptor: nil];
	NSArray* results = 
      [self.managedObjectContext executeFetchRequest: request 
                                               error: nil];
	return results;
}

-(NSFetchedResultsController*) 
fetchedResultsControllerForEntity: (NSString*) entityName
                    withPredicate: (NSPredicate*) predicate
                   sortDescriptor: (NSSortDescriptor*) sortDescriptor
{
  NSFetchRequest* request = [self makeFetchRequestForEntity: entityName
                                              withPredicate: predicate
                                             sortDescriptor: sortDescriptor];

  NSFetchedResultsController* con = 
    [[NSFetchedResultsController alloc] 
        initWithFetchRequest: request
        managedObjectContext: self.managedObjectContext
          sectionNameKeyPath: nil
                   cacheName: nil];

  NSError *error;
  if (![con performFetch: &error])
  {
    NSLog(@">>> Error fetching results for NSFetchedResultsController %@", con);
  }
  
  return [con autorelease];
}

-(void) dealloc
{
  [managedObjectContext release];
  [super dealloc];
}

@end
