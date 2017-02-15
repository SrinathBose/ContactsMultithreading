//
//  AddContact.m
//  Contacs
//
//  Created by Srinath Bose on 1/19/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "AddContactViewController.h"

@interface AddContactViewController ()
-(void)showAlert;
-(void)showDonebutton;
@property (nonatomic,strong)UITextField *currentTextField;
@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txtName.delegate=self;
    self.txtNumber.delegate=self;
    self.txtAddress.delegate=self;
    self.txtCity.delegate=self;
    self.txtAge.delegate=self;
    
    [self showDonebutton];
}

- (IBAction)btnAddContact:(id)sender
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString *sName = _txtName.text;
    NSNumber *nNumber = [numberFormatter numberFromString:_txtNumber.text];
    NSString *sAddress = _txtAddress.text;
    NSString *sCity = _txtCity.text;
    NSNumber *nAge = [numberFormatter numberFromString:_txtAge.text];
    
    if([sName isEqualToString:@""] || [sAddress isEqualToString:@""] || [sCity isEqualToString:@""] || [_txtAge.text isEqualToString:@""] || [_txtNumber.text isEqualToString:@""]){
        [self showAlert];
    }
    else{
    Person *newContact = [[Person alloc]init];
    newContact = [newContact initWithName:sName phone:nNumber age:nAge address:sAddress city:sCity];
    [self.delegate setNewContact:self didFinishedEnteringItem:newContact];
    [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)btnCancelAddingContact:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)showAlert{
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Alert"
                                message:@"Please fill all the fileds."
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok"
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction *action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES]; //YES ignores any textfield refusal to resign
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.txtName) {
        [textField resignFirstResponder];
        [self.txtNumber becomeFirstResponder];
    } else if(textField == self.txtAddress){
        [textField resignFirstResponder];
        [self.txtCity becomeFirstResponder];
    } else if(textField == self.txtCity){
        [textField resignFirstResponder];
        [self.txtAge becomeFirstResponder];
    }
    return YES;
}

-(void)showDonebutton{
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,320,50)];
    toolBar.barStyle=UIBarStyleDefault;
    toolBar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                      [[UIBarButtonItem alloc]initWithTitle:@"NEXT" style:UIBarButtonItemStyleDone target:self action:@selector(nextButtonPressed)]];
    
    [toolBar sizeToFit];
    _txtAge.inputAccessoryView = toolBar;
    _txtNumber.inputAccessoryView = toolBar;
}

-(void)nextButtonPressed{
    if(_currentTextField == self.txtNumber){
        [self.txtNumber resignFirstResponder];
        [self.txtAddress becomeFirstResponder];
    }
    else{
        //[self btnAddContact:nil];
        [self.txtAge resignFirstResponder];
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _currentTextField = textField;
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
