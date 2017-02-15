//
//  PersonDetailsTableViewController.m
//  Tab_Demo
//
//  Created by Srinath Bose on 1/10/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "Person.h"
#import "PersonDetailsTableViewController.h"
#import "ContactDisplayViewController.h"
#import "AddContactViewController.h"
#import "ContactManager.h"
#import "ThreadingContacts.h"

#define destinationViewName "DetailedContact"
#define cellName "PersonCell"
#define segueIdentifier "connect"
#define displayContactIdentifier "DisplayContact"
#define addContactIdentifier "AddContactViewController"
#define contactDisplayIdentifier "DetailedContact"
#define contactIconIdentifier "contact-icon.png"

@interface PersonDetailsTableViewController ()
@end

@implementation PersonDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ContactManager *manager = [[ContactManager alloc]init];
    _contacts = [manager getContacts];
}

- (IBAction)btnAddBulkContacts:(id)sender {
    [NSThread detachNewThreadSelector:@selector(newContactThread) toTarget:self withObject:nil];
}
-(void)newContactThread{
    for(int i = 0; i < 10; i++){
        Person *personObj1 = [[Person alloc]init];
        NSString *sName = [self genarateRandomString];
        NSString *sAddress = [self genarateRandomString];
        NSString *sCity = [self genarateRandomString];
        int iRandAge = arc4random_uniform(99);
        NSNumber *nAge = [NSNumber numberWithInt:iRandAge];
        int iRandPhone = arc4random_uniform(1000000000);
        NSNumber *nPhone = [NSNumber numberWithInt:iRandPhone];
        
        BOOL flag = [personObj1 initWithName:sName phone:nPhone age:nAge address:sAddress city:sCity];
        if(flag)
        {
            NSLog(@"Person %d Is Created Successfully",i);
            NSLog(@"Name Is %@",personObj1.sName);
            [_contacts addObject:personObj1];
        }
        NSLog(@"Contacts Count Is %ld",[_contacts count]);
    }
    [self.tableView reloadData];
}

-(NSString *)genarateRandomString{
    NSString *letters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int len = arc4random() % 26;
    NSMutableString *sRandString = [NSMutableString stringWithCapacity:len];
    for(int i = 0; i < len; i++)
        [sRandString appendFormat:@"%c",[letters characterAtIndex:arc4random()%len] + 1];
    return sRandString;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contacts count]; // Returns the total number of objects in oFamily object.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *oPerson = (self.contacts)[indexPath.row]; //Creating an object for a person
    
    //Assigning data source to the TableView
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@cellName];
    cell.textLabel.text=oPerson.sName;
    cell.detailTextLabel.text = [oPerson.nPhone stringValue];
    cell.indentationLevel=[[NSNumber numberWithInteger:5] intValue];
    cell.imageView.image = [UIImage imageNamed:@contactIconIdentifier];
    
    return cell; //Returns cell
}

- (IBAction)btnAddContact:(id)sender {
    AddContactViewController *addContact = [self.storyboard instantiateViewControllerWithIdentifier:@addContactIdentifier];
    addContact.delegate = self;
     [[self navigationController] pushViewController:addContact animated:YES];
}

-(void)setNewContact:(AddContactViewController *)controller didFinishedEnteringItem:(Person *) newPerson{
    if(![newPerson.sName isEqualToString:@""]){
        [_contacts addObject:newPerson]; // Storing a new person to the family object.

    }
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData]; // Reload All the data
    [self btnAddBulkContacts:0];
}

-(void)deleteContact:(ContactDisplayViewController *)controller didPressDeleteContactButton:(Person *) delPerson{
    [_contacts removeObject:delPerson];
}


/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@segueIdentifier]){
        

        ContactDisplayViewController *next = [segue destinationViewController]; //Select the destination view Controller
        
        NSIndexPath *selectedRowPath = [self.tableView indexPathForSelectedRow]; //get the index path
   
        int iIndex = (int)selectedRowPath.row; // Find the index of the seleted contact
        Person *selectedPerson = self.familyObj[iIndex]; // get the selected contact
        
        [next passDataToSegue:selectedPerson]; //pass the contact to the DisplayViewController 
        
        //[next passDataToSegue:_oFamily[(int)selectedRowPath]];
    }
}
 */


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    //UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil]; // Select the Storyboard
    
    ContactDisplayViewController *contactDisplayViewController = (ContactDisplayViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@destinationViewName]; //Select the particular view
    
    NSIndexPath *selectedRowPath = [self.tableView indexPathForSelectedRow]; //get the index path
    
    int index = (int)selectedRowPath.row; // Find the index of the seleted contact
    [contactDisplayViewController setPersonObj:self.contacts[index]];
    
    contactDisplayViewController.delDelegate = self; // Refering ContactDisplayViewController's delegate to this class (self)

    [self.navigationController pushViewController:contactDisplayViewController animated:YES];  // Navigating
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
