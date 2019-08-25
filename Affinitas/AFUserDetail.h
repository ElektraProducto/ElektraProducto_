//
//  AFUserDetail.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface AFUserDetail : JSONModel

@property(nonatomic, nullable) NSString* id;
@property(nonatomic, nullable) NSString* fullName;
@property(nonatomic, nullable) NSString* name;
@property(nonatomic, nullable) NSString* image_url;
@property(nonatomic, nullable) NSString* age;
@property(nonatomic, nullable) NSString* segment;
@property(nonatomic, nullable) NSArray* images;
@property(nonatomic, nullable) NSNumber* total_images;
@property(nonatomic, nullable) NSString* postcode;
@property(nonatomic, nullable) NSString* credit;
@property(nonatomic, nullable) NSString* onlineShopper;
@property(nonatomic, nullable) NSString* address;
@property(nonatomic, nullable) NSString* phone;
@property(nonatomic, nullable) NSString* mail;
@property(nonatomic, nullable) NSString* spent;

@property(nonatomic) BOOL wish_for_children;

@end
