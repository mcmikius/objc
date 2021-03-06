//
//  MainTableViewController.m
//  ToDoObjc
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailViewController.h"

@interface MainTableViewController ()

@property (nonatomic, strong) NSMutableArray * arrayEvents;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * array = [[UIApplication sharedApplication] scheduledLocalNotifications];
    self.arrayEvents = [[NSMutableArray alloc] initWithArray:array];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableViewWhenNewEvent) name:@"NewEvent" object:nil];
    
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) reloadTableViewWhenNewEvent {
    [self.arrayEvents removeAllObjects];
    NSArray * array = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    self.arrayEvents = [[NSMutableArray alloc] initWithArray:array];
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.arrayEvents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    UILocalNotification * notification = [self.arrayEvents objectAtIndex:indexPath.row];
    NSDictionary * dictionary = notification.userInfo;
    
    
    cell.textLabel.text = [dictionary objectForKey:@"eventInfo"];
    cell.detailTextLabel.text = [dictionary objectForKey:@"eventDate"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UILocalNotification * notification = [self.arrayEvents objectAtIndex:indexPath.row];
    NSDictionary * dictionary = notification.userInfo;
    
    DetailViewController * detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    detailViewController.eventInfo = [dictionary objectForKey:@"eventInfo"];
    detailViewController.eventDate = notification.fireDate;
    detailViewController.isDetail = YES;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        UILocalNotification * notification = [self.arrayEvents objectAtIndex:indexPath.row];
        [[UIApplication sharedApplication] cancelLocalNotification:notification];
        [self.arrayEvents removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
