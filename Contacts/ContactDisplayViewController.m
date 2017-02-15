//
//  ContactDisplayViewController.m
//  Tab_Demo
//
//  Created by Srinath Bose on 1/11/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "ContactDisplayViewController.h"
#import "Person.h"
#import "PersonDetailsTableViewController.h"

#define personViewIdentifier "ContactList"

@interface ContactDisplayViewController ()
/* {
    Person* personObj;
} */
@end

@implementation ContactDisplayViewController

- (void)viewDidLoad
{
    NSLog(@" view did load");
    [super viewDidLoad];
    if(_personObj!=nil){
        self.lblName.text = _personObj.sName;
        self.lblAddress.text = _personObj.sAddress;
        self.lblCity.text = _personObj.sCity;
        self.lblNumber.text = [_personObj.nPhone stringValue];
        self.lblAge.text = [_personObj.nAge stringValue];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@" view did appear");
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"  view will appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@" view will  disappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"  view did disappear");
}

/*-(BOOL)passDataToSegue:(Person *) person
{
    NSLog(@" pass data to seque  method");
    _personObj = person;
    return YES;
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDeleteContact:(id)sender
{
    [self.delDelegate deleteContact:self didPressDeleteContactButton:_personObj];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
