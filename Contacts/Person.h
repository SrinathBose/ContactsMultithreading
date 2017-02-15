//
//  Person.h
//  Tab_Demo
//
//  Created by Srinath Bose on 1/10/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

    -(id)initWithName:(NSString *)sName phone:(NSNumber *)nPhone age:(NSNumber *)nAge address:(NSString *)sAddress city:(NSString *)sCity;
    @property (strong,atomic,readwrite) NSString *sName;
    @property (strong,atomic,readwrite) NSString *sAddress;
    @property (strong,atomic,readwrite)NSString *sCity;
    @property(strong,atomic,readwrite) NSNumber *nAge;
    @property(strong,atomic,readwrite) NSNumber *nPhone;


@end
