@class Photo;

@interface PhotoDetailViewController : UIViewController
<UIScrollViewDelegate>
{
  Photo* photo;
  UIScrollView* scrollView;
  UIImageView* imageView;
}

@property(nonatomic, retain) Photo* photo;
@property(nonatomic, retain) UIScrollView* scrollView;
@property(nonatomic, retain) UIImageView* imageView;

-(id) initWithNibName: (NSString*) nib
               bundle: (NSBundle*) bundle
               photo: (Photo*) aPhoto;

@end
