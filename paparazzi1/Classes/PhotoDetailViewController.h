@class Photo;

@interface PhotoDetailViewController : UIViewController
{
  Photo* photo;
  IBOutlet UIImageView* photoView;
}

@property(retain) Photo* photo;
@property(retain) UIImageView* photoView;

-(id) initWithNibName: (NSString*) nib
               bundle: (NSBundle*) bundle
               photo: (Photo*) aPhoto;

@end
