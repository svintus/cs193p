
#import "PhotoListViewController.h"

#import "PhotoDetailViewController.h"
#import "PhotoListItemViewController.h"
#import "Photo.h"


@implementation PhotoListViewController

@synthesize contactName;
@synthesize photos;

-(void) initPhotoListViewControllers
{
  photoListItemViewControllers = 
      [[NSArray arrayWithObjects:
          [[PhotoListItemViewController alloc] 
              initWithNibName: @"PhotoListItemViewController"
                       bundle: [NSBundle mainBundle]
                       parent: self],
          [[PhotoListItemViewController alloc] 
              initWithNibName: @"PhotoListItemViewController"
                       bundle: [NSBundle mainBundle]
                       parent: self],
          [[PhotoListItemViewController alloc] 
              initWithNibName: @"PhotoListItemViewController"
                       bundle: [NSBundle mainBundle]
                       parent: self],
          nil] retain];

  
  PhotoListItemViewController* prevCon = nil;
  for (PhotoListItemViewController* con in photoListItemViewControllers)
  {
    [self.view addSubview: con.view];
    if (prevCon)
    {
      CGRect frame = prevCon.view.frame;
      frame.origin.y += frame.size.height;
      con.view.frame = frame;
    }
    prevCon = con;
  }
}

-(id) initWithNibName: (NSString*) nib
               bundle: (NSBundle*) bundle
              contact: (NSString*) contact
               photos: (NSArray*) photosToDisplay

{
  if ((self = [super initWithNibName: nib 
                              bundle: bundle])) 
  {
    self.contactName = contact;
    self.photos = photosToDisplay;
    [self initPhotoListViewControllers];
  }
  return self;
}

-(void) awakeFromNib
{
  self.contactName = nil;
  self.photos = get_photos();
  [self initPhotoListViewControllers];
}


-(void) initPhotoDetailViews
{
  int i = 0;
  for (Photo* photo in self.photos)
  {
    PhotoListItemViewController* con = 
        [photoListItemViewControllers objectAtIndex: i++];
    [con setPhoto: photo];
    con.view.hidden = NO;
  }
  for (; i < photoListItemViewControllers.count; i++)
  {
    [[[photoListItemViewControllers objectAtIndex: i] view] setHidden: YES];
  }
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

-(void) viewDidLoad
{
  if (self.contactName)
    self.title = [NSString stringWithFormat: @"%@'s Photos", contactName];
  else
    self.title = @"Recents";
  [self initPhotoDetailViews];
}

-(void) dealloc 
{
  [contactName release];
  [photos release];
  [photoListItemViewControllers release];
  [photoDetailViewController release];


  [super dealloc];
}

@end
