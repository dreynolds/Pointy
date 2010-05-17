//
//  PointyAppDelegate.h
//  Pointy
//
//  Created by David Reynolds on 16/05/2010.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface PointyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

