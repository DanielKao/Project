//
//  AddNewBoughtItemController.m
//  MAD project
//
//  Created by DanielKao on 2010/12/12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AddNewBoughtItemController.h"


@implementation AddNewBoughtItemController

@synthesize fieldTitles = _fieldTitles;
@synthesize datePicker = _datePicker;

#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
      self.fieldTitles = [NSArray arrayWithObjects:@"類別:", @"細節:", @"花費:", @"日期:", nil];
    }
    return self;
}

- (void)viewDidLoad {
  UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(AddNewBoughtItemCancel:)];
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(AddNewBoughtItemDone:)];
  
	
	self.navigationItem.rightBarButtonItem = doneButton;
	self.navigationItem.leftBarButtonItem = cancelButton;
  
	[doneButton release];
	[cancelButton release];

}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.datePicker = [[UIDatePicker alloc] init];
  self.datePicker.frame = CGRectMake(0, 265, 320, 300);  
  self.datePicker.datePickerMode = UIDatePickerModeDate;
  [self.view.window addSubview:self.datePicker];
  [self.view.window bringSubviewToFront:self.datePicker];  
  
}

- (void)viewWillDisappear:(BOOL)animated {
  [self.datePicker removeFromSuperview];
  [self.datePicker removeObserver:self forKeyPath:@"calendar"];
 [self.datePicker removeObserver:self forKeyPath:@"date"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
      NSLog(@"%@", self.datePicker.date);
  NSLog(@"%@", self.datePicker.calendar);
  NSLog(@"%@", self.datePicker);
  if ([keyPath isEqualToString:@"calendar"]) {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
  }
}
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
  
  cell.textLabel.text = [self.fieldTitles objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
  self.fieldTitles = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark AddNewBoughtItemCancel and AddNewBoughtItemDone

- (IBAction)AddNewBoughtItemDone:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)AddNewBoughtItemCancel:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}


@end

