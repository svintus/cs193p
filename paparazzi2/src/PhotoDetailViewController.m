#import "PhotoDetailViewController.h"
#import "Photo.h"

#define ZOOM_VIEW_TAG 100

@implementation PhotoDetailViewController

@synthesize photo;
@synthesize scrollView;
@synthesize imageView;

-(id) initWithNibName: (NSString*) nib
               bundle: (NSBundle*) bundle
               photo: (Photo*) aPhoto
{
  if ((self = [super initWithNibName: nib
                              bundle: bundle]))
    self.photo = aPhoto;
  return self;
}

-(void) centerImage
{

  CGSize screenSize = scrollView.frame.size;
  CGSize photoSize = imageView.image.size;
  CGFloat topInset = 
      (screenSize.height - photoSize.height * scrollView.zoomScale) / 2.0;
  topInset = topInset > 0.0 ? topInset: 0.0;

  [scrollView setContentInset: UIEdgeInsetsMake(topInset, 0, topInset, 0)];
}

-(void) loadView
{
  [super loadView];

  scrollView = [[UIScrollView alloc] initWithFrame: self.view.bounds];
  scrollView.backgroundColor = [UIColor blackColor];
  scrollView.delegate = self;
  scrollView.bouncesZoom = YES;

  [self.view addSubview: scrollView];

  imageView = 
      [[UIImageView alloc] initWithImage: [UIImage imageNamed: photo.path]];
  imageView.tag = ZOOM_VIEW_TAG; 
  imageView.userInteractionEnabled = YES;
  scrollView.contentSize = imageView.frame.size;
  [scrollView addSubview: imageView];

  CGFloat minScale = scrollView.frame.size.width / imageView.frame.size.width;
  scrollView.minimumZoomScale = minScale;
  scrollView.maximumZoomScale = 2.0f;
  scrollView.zoomScale = minScale;

  [self centerImage];
}


-(UIView*) viewForZoomingInScrollView: (UIScrollView*) view 
{
    return [scrollView viewWithTag: ZOOM_VIEW_TAG];
}

- (void)scrollViewDidScroll:(UIScrollView *) sv
{
  [self centerImage];
}


-(void) dealloc
{
  [scrollView release];
  [super dealloc];
}

@end
