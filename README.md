SLComposeViewController-Extended for iOS
================================

Dismissing a SLComposeViewController did not work well on iOS. Some kind of bug.

This code extends the SLComposeViewController to make it work.

The same principle can be applied to any UIViewController that is not running the completion
block on dismissal.

Using this:

1) import the header on your class
2) create a SLComposeViewController normally.

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

    
    
    
