//
//  Person.m
//  Tab_Demo
//
//  Created by Srinath Bose on 1/10/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "Person.h"

@implementation Person

-(BOOL)storeInformationAboutPerson:(NSString*)sName address:(NSString*)sAddress city:(NSString*)sCity age:(NSNumber*)nAge phone:(NSNumber*)nPhone{
    
    // Assigning values to Person object from PersonDetailsTableViewController.m
    
    
    return YES;
}


-(id)initWithName:(NSString *)sName phone:(NSNumber *)nPhone age:(NSNumber *)nAge address:(NSString *)sAddress city:(NSString *)sCity {
    if(self = [super init])
    {
        self.sName = sName;
        self.sAddress = sAddress;
        self.sCity = sCity;
        self.nAge = nAge;
        self.nPhone = nPhone;
    }
    return self;
}

@end
