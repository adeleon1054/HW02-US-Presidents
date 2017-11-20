//
//  Presidents.h
//  HW02-US-Presidents
//
//  Created by Asdruval De Leon on 11/19/17.
//  Copyright © 2017 Asdruval De Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Presidents : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* born;
@property (nonatomic, strong) NSString* bornLocation;
@property (nonatomic, strong) NSString* died;
@property (nonatomic, strong) NSString* diedLocation;
@property (nonatomic, strong) NSString* officeTerm;
@property (nonatomic, strong) NSString* termServed;
@property (nonatomic, strong) NSString* politicalParty;
@property (nonatomic, strong) NSString* occupation;
@property (nonatomic, strong) UIImage* presidentImg;

@end


