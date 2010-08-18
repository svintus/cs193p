#import "PhotoDetailViewController.h"
#import "Photo.h"

@implementation PhotoDetailViewController

@synthesize photo;
@synthesize photoView;

-(id) initWithNibName: (NSString*) nib
               bundle: (NSBundle*) bundle
               photo: (Photo*) aPhoto
{
  if ((self = [super initWithNibName: nib
                              bundle: bundle]))
    self.photo = aPhoto;
  return self;
}

-(void) viewDidLoad
{
  self.title = [NSString stringWithFormat: @"%@", photo.name];
  self.photoView.image = [UIImage imageNamed: photo.fileName];
}

-(void) dealloc
{
  [photoView release];
  [super dealloc];
}

@end
