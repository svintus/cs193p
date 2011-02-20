//
//  Person.h
//  paparazzi2
//
//  Created by Ivan Sergeyenko on 10-07-22.
//  Copyright 2010 CatPig Studios Inc. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Person :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* photos;

@end


@interface Person (CoreDataGeneratedAccessors)
- (void)addPhotosObject:(NSManagedObject *)value;
- (void)removePhotosObject:(NSManagedObject *)value;
- (void)addPhotos:(NSSet *)value;
- (void)removePhotos:(NSSet *)value;

@end

