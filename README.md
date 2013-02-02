SLComposeViewController-Extended for iOS
================================

Try to dismiss a SLComposeViewController with a completion block and you will see that the block
will not be called every time. Probably some kind of bug on iOS 6.

This code extends the SLComposeViewController class to make the controller run a block on dismissal and baby, this works.
😃

The same principle can be applied to any UIViewController that is not running the completion
block on dismissal.

Using this:

1) import the header on your class

    #import "SLComposeViewController+OnFinishing.h"


2) create a SLComposeViewController

    SLComposeViewController *controller = [SLComposeViewController
                  composeViewControllerForServiceType:SLServiceTypeFacebook]; // can be twitter or whatever
    
    [controller setInitialText:myText];
    [controller addURL:myURL];
    [controller addImage:myImage];


3) set the onFinishing block using

    myController.onFinishing = ^{
        ... add here the code you want to run when this controller is dismissed
    };
 
4) set the completionHandler block to dismiss the controller

    controller.completionHandler = ^(SLComposeViewControllerResult result){
        [controller dismissViewControllerAnimated:YES completion:NULL];
    };
    
5) present the controller

    [self presentViewController:controller
            animated:YES
          completion:NULL];
          
that's it. Don't forget to import the social framework.

    
    
    
