//
//  PersonDetailsTableViewController.h
//  Tab_Demo
//
//  Created by Srinath Bose on 1/10/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "AddContactViewController.h"
#import "ContactDisplayViewController.h"
        
@interface PersonDetailsTableViewController : UITableViewController<AddContactDelegate,DeleteContactDelegate>
- (IBAction)btnAddBulkContacts:(id)sender;

@property (strong,nonatomic,readwrite)NSMutableArray *contacts; // To store array of Person objects
- (IBAction)btnAddContact:(id)sender;
@end

