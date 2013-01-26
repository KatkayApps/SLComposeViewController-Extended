//
//  SLComposeViewController+OnFinishing.h
//  
//
//  Created by Magno Urbano
//  Copyright (c) 2013 Magno Urbano. All rights reserved.
//  http://www.addfone.com/iphoneapp/mu
//

#import <UIKit/UIKit.h>
#import "social/Social.h"




@interface SLComposeViewController (OnFinishing)



@property (nonatomic, strong) void (^onFinishing)();





@end
