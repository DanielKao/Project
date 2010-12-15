//
//  AddNewBoughtItemController.h
//  MAD project
//
//  Created by DanielKao on 2010/12/12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddNewBoughtItemController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
  NSArray *_fieldTitles;
  UIDatePicker *_datePicker;
}

@property (nonatomic, retain) NSArray *fieldTitles;
@property (nonatomic, retain) UIDatePicker *datePicker;

- (IBAction)AddNewBoughtItemDone:(id)sender;
- (IBAction)AddNewBoughtItemCancel:(id)sender;
  

@end
