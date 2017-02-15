//
//  ContactManager.h
//  Contacs
//
//  Created by Srinath Bose on 1/24/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactManager : NSObject

-(NSMutableArray *) getContacts;
-(BOOL) storeContact:Person;
-(int) contactsHelper;

@end
