/* Points */

#import <UIKit/UIKit.h>

@interface Points : NSObject
{
	float calories;
	float satFat;
	float points;
}
+ (float)calculatePoints:(float)calories atRate:(float)satFat;
@end
