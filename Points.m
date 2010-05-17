#import "Points.h"

@implementation Points
+ (float)calculatePoints:(float)enteredCalories atRate:(float)enteredSatFat {
	float calculatedPoints, calPoints, fatPoints, roundedPoints;
	
	calPoints = (3 * enteredCalories) / 200;
	fatPoints = enteredSatFat / 4;
	calculatedPoints = calPoints + fatPoints;

	roundedPoints = (floorf((calculatedPoints * 2)) / 2);

	//DLog("Calculated Points: %d\n", calculatedPoints);
	//DLog("Rounded Points: %d\n\n", roundedPoints);
	
	return roundedPoints;
}
@end