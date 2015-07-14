//
//  Product.h
//  SampleCoreData
//
//  Created by Athul on 26/06/15.
//  Copyright (c) 2015 Athul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>



@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;

@end

