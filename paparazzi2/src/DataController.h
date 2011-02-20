@interface DataController : NSObject
{
  NSManagedObjectContext* managedObjectContext;
}

@property(nonatomic, readonly) NSManagedObjectContext* managedObjectContext;


+(DataController*) sharedController;

-(NSArray*) fetchManagedObjectsForEntity: (NSString*) entityName
                           withPredicate: (NSPredicate*) predicate;

-(NSFetchedResultsController*) 
fetchedResultsControllerForEntity: (NSString*) entityName
                    withPredicate: (NSPredicate*) predicate
                   sortDescriptor: (NSSortDescriptor*) sortDescriptor;
                                

@end
