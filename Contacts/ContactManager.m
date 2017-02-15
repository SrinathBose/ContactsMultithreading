//
//  ContactManager.m
//  Contacs
//
//  Created by Srinath Bose on 1/24/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "ContactManager.h"
#import "Person.h"
#import "IContact.h"

@implementation ContactManager

-(NSMutableArray *) getContacts{
    Person *personObj1 = [[Person alloc]init];
    IContact *iContact = [[IContact alloc]init];
    iContact.contacts = [NSMutableArray arrayWithCapacity:10];
    
    NSString *sName = @"B.Srinath";
    NSString *sAddress = @"XXX";
    NSString *sCity = @"Sivakasi";
    NSNumber *nAge = [NSNumber numberWithUnsignedInteger:23];
    NSNumber *nPhone = [NSNumber numberWithLong:8148004133];
    
    BOOL flag = [personObj1 initWithName:sName phone:nPhone age:nAge address:sAddress city:sCity];
    if(flag)
    {
        NSLog(@"Person 1 Is Created Successfully");
        [iContact.contacts addObject:personObj1];
    }

    
    Person *personObj2 = [[Person alloc]init];  //Creating Person object 2
    
    sName = @"S.Sundar";
    sAddress = @"YYY";
    sCity = @"Thiruthangal";
    nAge = [NSNumber numberWithUnsignedInteger:22];
    nPhone = [NSNumber numberWithLong:9543395322];
    
    flag =  [personObj2 initWithName:sName phone:nPhone age:nAge address:sAddress city:sCity];
    
    if(flag)
    {
        NSLog(@"Person 2 Is Created Successfully");
        [iContact.contacts addObject:personObj2];
    }

    return iContact.contacts;
    
}

-(BOOL) storeContact:Person{
    return YES;
}

-(int) contactsHelper{
    return 1;
}
@end
