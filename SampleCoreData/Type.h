//
//  Type.h
//  SampleCoreData
//
//  Created by Athul on 14/07/15.
//  Copyright (c) 2015 Athul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Type : NSManagedObject

@property (nonatomic, retain) NSString * kind;
@property (nonatomic, retain) NSSet *product;
@end

@interface Type (CoreDataGeneratedAccessors)

- (void)addProductObject:(NSManagedObject *)value;
- (void)removeProductObject:(NSManagedObject *)value;
- (void)addProduct:(NSSet *)values;
- (void)removeProduct:(NSSet *)values;

@end
