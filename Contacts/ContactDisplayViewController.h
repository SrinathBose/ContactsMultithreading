//
//  ContactDisplayViewController.h
//  Tab_Demo
//
//  Created by Srinath Bose on 1/11/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@class ContactDisplayViewController;

@protocol DeleteContactDelegate <NSObject>
-(void)deleteContact:(ContactDisplayViewController *)controller didPressDeleteContactButton:(Person *) delPerson;
@end

@interface ContactDisplayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;

- (IBAction)btnDeleteContact:(id)sender;

@property(nonatomic,weak) id<DeleteContactDelegate> delDelegate;

@property(nonatomic,strong)Person *personObj;

@end
