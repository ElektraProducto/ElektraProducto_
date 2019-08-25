//
//  AFUsers.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface AFUsers : JSONModel
//This model collects JSON which is responded by calling with "action == list" && "id == userId" parameter

@property(nonatomic, nullable) NSString* _id;
@property(nonatomic, nullable) NSString* fullName;
@property(nonatomic, nullable) NSString* image_url;
@property(nonatomic, nullable) NSString* age;
@property(nonatomic, nullable) NSString* segment;
@property(nonatomic, nullable) NSString* total_images;
@property(nonatomic, nullable) NSString* credit;
@property(nonatomic, nullable) NSString* onlineShopper;
@property(nonatomic, nullable) NSString* address;
@property(nonatomic, nullable) NSString* phone;
@property(nonatomic, nullable) NSString* mail;
@property(nonatomic, nullable) NSString* spent;
@property(nonatomic, nullable) NSArray* images;

@end
