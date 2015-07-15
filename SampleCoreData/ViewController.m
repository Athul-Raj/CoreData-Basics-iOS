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
#import "Type.h"

@interface ViewController ()
{
    AppDelegate *_appDelegate;
    NSArray *data;
    NSString *itemType;
}
 @property IBOutlet UIPickerView *option;
@property NSManagedObjectContext *context;

@end


@implementation ViewController

- (void)viewDidLoad {
  
    [super viewDidLoad];
    _appDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    data = @[@"Electronic", @"Fashion", @"Beauty",@"Cosmetics" ];
    self.option.delegate = self;
    self.option.dataSource = self;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveAction:(id)sender {
   _context = [_appDelegate managedObjectContext];
    
    Product *pro = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:_appDelegate.managedObjectContext];
    Type *type = [NSEntityDescription insertNewObjectForEntityForName:@"Type" inManagedObjectContext:_appDelegate.managedObjectContext];

    pro.name = _nameText.text;
    //[pro setValue:_nameText.text forKey:@"name"];
    int numb = [_priceText.text intValue];
    pro.price = [NSNumber numberWithInt: numb];

    type.kind = itemType;

    pro.type = type;
    
    [_appDelegate saveContext];

    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Product"];
    NSSortDescriptor *sd = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[sd]];
    
    NSArray *temp = [_context executeFetchRequest:request error:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
   
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [data count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return data[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    itemType = data[row];
   // [_context insertObject:type];
    //[_appDelegate saveContext];

}

@end
