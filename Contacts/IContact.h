//
//  IContact.h
//  Contacs
//
//  Created by Srinath Bose on 1/24/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IContact : NSObject

@property(nonatomic,assign)BOOL isFromRemoteServer;
@property(nonatomic,assign)BOOL isFormDB;
@property(nonatomic,assign)BOOL isFromArray;

@property(atomic,strong)NSMutableArray *contacts;

-(NSMutableArray *) getContacts;
-(BOOL) storeContact:Person;

@end
