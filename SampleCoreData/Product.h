//
//  Product.h
//  SampleCoreData
//
//  Created by Athul on 15/07/15.
//  Copyright (c) 2015 Athul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Type;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) Type *type;

@end
