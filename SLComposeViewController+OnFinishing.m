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
#import "SLComposeViewController+OnFinishing.h"
#import "social/Social.h"
#import <objc/runtime.h>


static char const * const onFinishingKey = "onFinishingRef";

@implementation SLComposeViewController (OnFinishing)



//@dynamic aoTerminar;

- (void) setOnFinishingKey:(void (^)())onFinishing {
    objc_setAssociatedObject(self, onFinishingKey, onFinishing, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())onFinishing {
    return objc_getAssociatedObject(self, onFinishingKey);
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.onFinishing();
}


@end
