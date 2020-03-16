#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSString* result = @"";
    
    NSInteger realSum = 0;
    
    for (NSInteger currentIndex = 0; currentIndex < bill.count; currentIndex++) {
        
        if (currentIndex != index) {
            
            realSum += bill[currentIndex].integerValue;
        }
    }
    
    NSInteger difference = sum.integerValue - (realSum/2);
    
    (realSum/2) == sum.integerValue ? (result = @"Bon Appetit") : (result = [NSString stringWithFormat:@"%ld", difference]);
    
    return result;
}

@end
