
NSArray* get_photos(void);
NSArray* get_photos_for_contact(NSString* name);

@interface Photo : NSObject
{
  NSString* name;
  NSString* authorName;
  NSString* fileName;
}

@property(copy) NSString* name;
@property(copy) NSString* authorName;
@property(readonly) NSString* fileName;

-(id) initWithName: (NSString*) name
        authorName: (NSString*) authorName
          fileName: (NSString*) fileName;

+(id) photoWithName: (NSString*) name
         authorName: (NSString*) authorName
           fileName: (NSString*) fileName;

@end
