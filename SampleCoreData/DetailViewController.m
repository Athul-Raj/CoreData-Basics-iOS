//
//  DetailViewController.m
//  SampleCoreData
//
//  Created by Athul on 25/06/15.
//  Copyright (c) 2015 Athul. All rights reserved.
//

#import "DetailViewController.h"
#import "Product.h"
#import "TableViewTableViewController.h"
#import "AppDelegate.h"
extern NSNumber *rownumber;
@interface DetailViewController (){
    NSManagedObjectContext *context;
    AppDelegate *_appdelegate;
}
@property Product *pro;
@property NSArray *items;

@end

@implementation DetailViewController

- (NSManagedObjectContext *) managedobjectcontext{
    NSManagedObjectContext *context1 = nil;
    
    id AppDel = [[UIApplication sharedApplication]delegate];
    if ([AppDel respondsToSelector:@selector(managedObjectContext)]) {
        context1 = [AppDel managedObjectContext];
    }
    return context1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    context = [self managedobjectcontext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Product"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    _items = [context executeFetchRequest:request error:nil];
    _detailLabel.text = [[_items objectAtIndex:(NSUInteger)rownumber]name];
    //NSLog(@"number %d",(int)rownumber);
    //NSLog(@"dert: %@",[[_items objectAtIndex:(NSUInteger)rownumber]name]);
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)deleteAction:(id)sender {
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Product"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    
    _items = [context executeFetchRequest:request error:nil];
    
    _detailLabel.text = [[_items objectAtIndex:(NSUInteger)rownumber]name];
    
    
    // NSManagedObject *managObj = [[NSManagedObject alloc]init];
    //[managObj a ]
    [context deleteObject:[_items objectAtIndex:(NSUInteger)rownumber]];
    _appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    [_appdelegate saveContext];
     [self.navigationController popToRootViewControllerAnimated:YES];

}
@end
