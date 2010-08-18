@class Photo;
@class PhotoListViewController;

@interface PhotoListItemViewController : UIViewController
{
  Photo* photo;
  PhotoListViewController* parent;

  IBOutlet UIImageView* image;
  IBOutlet UILabel* name;
  IBOutlet UILabel* author;
  IBOutlet UIButton* button;
}

@property(retain) Photo* photo;
@property(retain) PhotoListViewController* parent;
@property(retain) UIImageView* image;
@property(retain) UILabel* name;
@property(retain) UILabel* author;
@property(retain) UIButton* button;

-(id) initWithNibName: (NSString*) nib
                 bundle: (NSBundle*) bundle
                 parent: (PhotoListViewController*) parent;

-(IBAction) buttonPressed;

@end
