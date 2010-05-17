//
//  MainViewController.h
//  Pointy
//
//  Created by David Reynolds on 16/05/2010.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	IBOutlet UITextField *enteredCalories;
	IBOutlet UITextField *enteredSaturatedFat;
}
@property (readonly, retain) UITextField *enteredCalories;
@property (readonly, retain) UITextField *enteredSaturatedFat;

- (IBAction)showInfo;
- (IBAction)calculatePoints;

@end
