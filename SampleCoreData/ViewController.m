//
//  ViewController.m
//  SampleCoreData
//
//  Created by Athul on 25/06/15.
//  Copyright (c) 2015 Athul. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Product.h"
#import "TableViewTableViewController.h"
@interface ViewController ()
{
    AppDelegate *_appDelegate;
}
@property NSManagedObjectContext *context;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    _context = [_appDelegate managedObjectContext];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveAction:(id)sender {
    Product *pro = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:_appDelegate.managedObjectContext];
    pro.name = _nameText.text;

    int numb = [_priceText.text intValue];
    pro.price = [NSNumber numberWithInt: numb];
    //  Type *type = [NSEntityDescription insertNewObjectForEntityForName:@"Type" inManagedObjectContext:_appDelegate.managedObjectContext];
    // type.number = @1;
    //  [pro addTypeObject:type];
   // [_context insertObject:pro];
    
    
    [_appDelegate saveContext];

    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
