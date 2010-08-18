
#import <UIKit/UIKit.h>

@class Photo;
@class PhotoDetailViewController;

@interface PhotoListViewController : UIViewController 
{
  NSString* contactName;
  NSArray* photos;
  PhotoDetailViewController* photoDetailViewController;

  NSArray* photoListItemViewControllers;
}

@property(copy) NSString* contactName;
@property(retain) NSArray* photos;

-(id) initWithNibName: (NSString*) nib
               bundle: (NSBundle*) bundle
              contact: (NSString*) contact
               photos: (NSArray*) photos;

-(void) viewDetailsForPhoto: (Photo*) photo;

@end
