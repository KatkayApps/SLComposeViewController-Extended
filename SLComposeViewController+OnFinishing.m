//
//  UIViewController+OnCompletionViewController.m
//  photoshopCS6
//
//  Created by Fireball on 26/01/13.
//  Copyright (c) 2013 Magno Urbano. All rights reserved.
//

#import "SLComposeViewController+OnCompletion.h"
#import "social/Social.h"
#import <objc/runtime.h>


static char const * const aoTerminarKey = "AoTerminarRef";

@implementation SLComposeViewController (OnCompletion)



//@dynamic aoTerminar;

- (void) setAoTerminar:(void (^)())aoTerminar {
    objc_setAssociatedObject(self, aoTerminarKey, aoTerminar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())aoTerminar {
    return objc_getAssociatedObject(self, aoTerminarKey);
}




- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    self.aoTerminar();

}


@end
