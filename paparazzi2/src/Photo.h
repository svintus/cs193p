#import <CoreData/CoreData.h>

@class Person;

@interface Photo :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) Person * author;

@end



