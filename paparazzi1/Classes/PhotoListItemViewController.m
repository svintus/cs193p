#import "PhotoListItemViewController.h"

#import "Photo.h"
#import "PhotoListViewController.h"

@implementation PhotoListItemViewController

@synthesize photo;
@synthesize parent;
@synthesize image;
@synthesize name;
@synthesize author;
@synthesize button;

-(id) initWithNibName: (NSString*) nib
                 bundle: (NSBundle*) bundle
                 parent: (PhotoListViewController*) aParent
{
  if ((self = [super initWithNibName: nib
                              bundle: bundle]))
    self.parent = aParent;
  return self;
}

-(void) dealloc
{
  [image release];
  [name release];
  [author release];
  [button release];
  [photo release];

  [super dealloc];
}

-(void) viewDidLoad
{
  self.image.image = [UIImage imageNamed: self.photo.fileName];
  self.name.text = self.photo.name;
  self.author.text = self.photo.authorName;
}

-(IBAction) buttonPressed
{
  [self.parent viewDetailsForPhoto: self.photo];
}

@end
