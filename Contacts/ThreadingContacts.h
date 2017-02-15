//
//  ThreadingContacts.h
//  Contacs
//
//  Created by Srinath Bose on 1/25/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreadingContacts : NSObject
-(NSMutableArray *)getContactsThread;
@property(strong,nonatomic)NSMutableArray* tContacts;
@end
