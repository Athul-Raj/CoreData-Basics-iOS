
//
//  TableViewTableViewController.m
//  SampleCoreData
//
//  Created by Athul on 25/06/15.
//  Copyright (c) 2015 Athul. All rights reserved.
//

#import "TableViewTableViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"

NSInteger *rownumber;
@interface TableViewTableViewController (){
AppDelegate *_appDelegate;
// Type *type;
NSManagedObjectContext *context;
    
}
@property Product *pro;
@property NSArray *items;
@property NSArray *type;
@end

@implementation TableViewTableViewController

- (NSManagedObjectContext *) managedobjectcontext{
NSManagedObjectContext *context1 = nil;

id AppDel = [[UIApplication sharedApplication]delegate];
if ([AppDel respondsToSelector:@selector(managedObjectContext)]) {
    context1 = [AppDel managedObjectContext];
}
return context1;
}

/*- (void)viewDidLoad {
[super viewDidLoad];
context = [self managedobjectcontext];

//    _pro = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];

NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Product"];
NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
[request setSortDescriptors:@[sortDescriptor]];

_items = [context executeFetchRequest:request error:nil];
// Uncomment the following line to preserve selection between presentations.
// self.clearsSelectionOnViewWillAppear = NO;

// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/
-(void)viewWillAppear:(BOOL)animated{
    context = [self managedobjectcontext];
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Product"];
    NSSortDescriptor *sd = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[sd]];
    _items = [context executeFetchRequest:request error:nil];
    NSLog(@"%@",_items);
    
    NSFetchRequest *req = [[NSFetchRequest alloc]initWithEntityName:@"Type"];
    _type = [context executeFetchRequest:req error:nil];
     NSLog(@"%@",_type);
    [self.tableView reloadData];
    //[self.tableView reloadInputViews];
}

- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
// Return the number of sections.
return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
// Return the number of rows in the section.

return [_items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
cell.textLabel.text = [[_items objectAtIndex:indexPath.row]name];
//NSLog(@"content:%@:",[[_items objectAtIndex:indexPath.row]name]);
return cell;
    
}

-(void)tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
rownumber = indexPath.row;
[self.tableView reloadData];

}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
// Return NO if you do not want the specified item to be editable.
return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
if (editingStyle == UITableViewCellEditingStyleDelete) {
// Delete the row from the data source
[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
} else if (editingStyle == UITableViewCellEditingStyleInsert) {
// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
}
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
// Return NO if you do not want the item to be re-orderable.
return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// Get the new view controller using [segue destinationViewController].
// Pass the selected object to the new view controller.
}
*/

@end
