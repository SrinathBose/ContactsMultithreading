//
//  AddContact.h
//  Contacs
//
//  Created by Srinath Bose on 1/19/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@class AddContactViewController;

@protocol AddContactDelegate<NSObject>
-(void)setNewContact:(AddContactViewController *)controller didFinishedEnteringItem:(Person *) newPerson;
@end

@interface AddContactViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;

- (IBAction)btnAddContact:(id)sender;
- (IBAction)btnCancelAddingContact:(id)sender;

@property(nonatomic,weak) id<AddContactDelegate> delegate;

@end
