//
//  MainViewController.m
//  Pointy
//
//  Created by David Reynolds on 16/05/2010.
//

#import "MainViewController.h"
#import "Points.h"


@implementation MainViewController
@synthesize enteredCalories, enteredSaturatedFat;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}

- (void)calculatePoints {
	// Check if the values entered in the boxes are floats...
	if (![[NSScanner scannerWithString:enteredCalories.text] scanFloat:NULL] || 
		![[NSScanner scannerWithString:enteredSaturatedFat.text] scanFloat:NULL]) {
		// ...if they are not, display an error alert...
		UIAlertView *errorAlert = [[UIAlertView alloc] 
								   initWithTitle:@"Error" 
								   message:@"One of the values you entered is not a valid number" 
								   delegate:self 
								   cancelButtonTitle:@"Close" 
								   otherButtonTitles:nil, nil];
		[errorAlert show];
		[errorAlert release];
	}
	else {
		// .. if they are, calculate the points and then display an alert
		// with them in.
		float calories = [enteredCalories.text floatValue];
		float satFat = [enteredSaturatedFat.text floatValue];
		float points = [Points calculatePoints:calories atRate:satFat];
		NSString *messageString = [[NSString alloc] initWithFormat:@"%0.1f", points];
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:@"Points calculated are" 
							  message:messageString
							  delegate:self
							  cancelButtonTitle:@"Clear values"
							  otherButtonTitles:@"Close", nil];
		[alert show];
		[alert release];
		[messageString release];
	}
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	// Cancel button empties the boxes, close button just dismisses the UIAlertView
	[enteredCalories performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.1];
	if (buttonIndex == 0) {
		enteredCalories.text = @"";
		enteredSaturatedFat.text = @"";
	}
}
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}
*/


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
	[enteredCalories release];
	[enteredSaturatedFat release];
    [super dealloc];
}


@end
