#import "Points.h"

@implementation Points
+ (float)calculatePoints:(float)enteredCalories atRate:(float)enteredSatFat {
	float calculatedPoints, calPoints, fatPoints, roundedPoints;
	
	calPoints = enteredCalories / 70;
	fatPoints = enteredSatFat / 4.05;
	calculatedPoints = calPoints + fatPoints;

	roundedPoints = (floorf((calculatedPoints * 2)) / 2);

	DLog("Calculated Points: %d\n", calculatedPoints);
	DLog("Rounded Points: %d\n\n", roundedPoints);
	
	return roundedPoints;
}
@end