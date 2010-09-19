#import "Photo.h"

@implementation Photo

@synthesize name;
@synthesize authorName;
@synthesize fileName;


NSArray* get_photos(void)
{
  return [NSArray arrayWithObjects:
            [Photo photoWithName: @"A wonderful day"
                      authorName: @"Fred"
                        fileName: @"images/one"],
            [Photo photoWithName: @"Cool photo"
                      authorName: @"Fred"
                        fileName: @"images/two"],
            [Photo photoWithName: @"Nice one!"
                      authorName: @"Bob"
                        fileName: @"images/three"],
            nil];
}

NSArray* get_photos_for_contact(NSString* name)
{
  return [get_photos() filteredArrayUsingPredicate: 
              [NSPredicate predicateWithFormat: 
                  @"authorName like %@", name]];
}

-(id) initWithName: (NSString*) aName
        authorName: (NSString*) anAuthorName
          fileName: (NSString*) aFileName
{
  if ((self = [super init]))
  {
    self.name = aName;
    self.authorName = anAuthorName;
    fileName = [[aFileName stringByAppendingPathExtension: @"jpg"] retain];
  }
  return self;
}

+(id) photoWithName: (NSString*) name
         authorName: (NSString*) authorName
           fileName: (NSString*) fileName
{
  return [[Photo alloc] initWithName: name
                          authorName: authorName
                            fileName: fileName];
}

-(NSString*) fileNameWithExtension
{
  return [self.fileName stringByAppendingPathExtension: @"jpg"];
}

-(void) dealloc
{
  [name release];
  [authorName release];
  [fileName release];

  [super dealloc];
}

@end
