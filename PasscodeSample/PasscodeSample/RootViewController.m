//
//  RootViewController.m
//  PasscodeSample
//
//  Created by Johan Kool on 3/17/11.
//  Copyright 2011 Koolistov. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (IBAction)showPasscode:(id)sender {
    KVPasscodeViewController *passcodeController = [[KVPasscodeViewController alloc] init];
    passcodeController.delegate = self;
    UINavigationController *passcodeNavigationController = [[UINavigationController alloc] initWithRootViewController:passcodeController];
    [self.navigationController presentModalViewController:passcodeNavigationController animated:YES];
    [passcodeNavigationController release];
    [passcodeController release];
}

#pragma mark - KVPasscodeViewControllerDelegate 
- (void)passcodeController:(KVPasscodeViewController *)controller passcodeEntered:(NSString *)passCode {
    if ([passCode isEqualToString:@"1234"]) {
        [controller dismissModalViewControllerAnimated:YES];
    } else if ([passCode isEqualToString:@"0000"]) {
        controller.instructionLabel.text = NSLocalizedString(@"Please confirm passcode.", @"");
        [controller resetWithAnimation:KVPasscodeAnimationStyleConfirm];
    } else {
        controller.instructionLabel.text = [NSString stringWithFormat:NSLocalizedString(@"You entered: '%@'. Try '1234' or '0000'.", @""), passCode];
        [controller resetWithAnimation:KVPasscodeAnimationStyleInvalid];
    }
}

#pragma mark - 
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
