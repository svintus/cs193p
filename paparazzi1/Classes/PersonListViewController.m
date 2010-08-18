
#import "PersonListViewController.h"

#import "Photo.h"
#import "PhotoListViewController.h"


@implementation PersonListViewController

-(id) init
{
  if ((self = [super init]))
    photoListViewController = nil;
  return self;
}

-(void) viewPhotosForContact: (NSString*) contact
{
  [photoListViewController release];

  photoListViewController =
    [[PhotoListViewController alloc] 
        initWithNibName: @"PhotoListViewController"
                 bundle: [NSBundle mainBundle]
                contact: contact
                 photos: get_photos_for_contact(contact)];
  [self.navigationController pushViewController: photoListViewController
                                       animated: YES];
}

-(IBAction) viewFredsPhotos: (id) sender
{
  [self viewPhotosForContact: @"Fred"];
}

-(IBAction) viewBobsPhotos: (id) sender
{
  [self viewPhotosForContact: @"Bob"];
}

-(void) dealloc
{
  [photoListViewController release];

  [super dealloc];
}

@end
