//
//  RootViewController.h
//  PasscodeSample
//
//  Created by Johan Kool on 3/17/11.
//  Copyright 2011 Koolistov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KVPasscodeViewController.h"

@interface RootViewController : UIViewController <KVPasscodeViewControllerDelegate> {

}

- (IBAction)showPasscode:(id)sender;

@end
