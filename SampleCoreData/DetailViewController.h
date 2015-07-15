//
//  DetailViewController.h
//  SampleCoreData
//
//  Created by Athul on 25/06/15.
//  Copyright (c) 2015 Athul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
- (IBAction)deleteAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;

@end
