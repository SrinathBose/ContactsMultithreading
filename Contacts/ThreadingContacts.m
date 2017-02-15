//
//  ThreadingContacts.m
//  Contacs
//
//  Created by Srinath Bose on 1/25/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "ThreadingContacts.h"
#import "IContact.h"
#import "Person.h"

@implementation ThreadingContacts

-(id) initWithContact{
    _tContacts = [NSMutableArray arrayWithCapacity:30];
    return self;
}
-(NSMutableArray *)getContactsThread
{
    [NSThread detachNewThreadSelector:@selector(newContactThread) toTarget:self withObject:nil];
    NSLog(@"Contact Is Created");
    return _tContacts;
}


-(NSMutableArray *)newContactThread{
    for(int i = 0; i < 10; i++){
        Person *personObj1 = [[Person alloc]init];
        NSString *sName = @"B.Srinath";
        NSString *sAddress = @"XXX";
        NSString *sCity = @"Sivakasi";
        NSNumber *nAge = [NSNumber numberWithUnsignedInteger:23];
        NSNumber *nPhone = [NSNumber numberWithLong:8148004133];
        
        BOOL flag = [personObj1 initWithName:sName phone:nPhone age:nAge address:sAddress city:sCity];
        if(flag)
        {
            NSLog(@"Person %d Is Created Successfully",i);
            NSLog(@"Name Is %@",personObj1.sName);
            [_tContacts addObject:personObj1];
        }
        NSLog(@"Contacts Count Is %ld",[_tContacts count]);

    }
    return _tContacts;
}
@end
