#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSMutableArray* myArray = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < s.length; index++) {
        
        NSString* myString = [s substringWithRange:NSMakeRange(index, 1)];
        
        [myArray addObject:myString];
    }
    
    NSInteger count = 0;
    
    NSInteger previousMax = 0;
    
    for (NSInteger index = (n.integerValue / 2); index >= 0; index -= 1) {
        
        NSInteger leftObject = [[myArray objectAtIndex: index] integerValue];
        
        NSInteger rightObject = [[myArray objectAtIndex: (n.integerValue - index - 1) ] integerValue];
        
        if (leftObject != rightObject) {
            
            previousMax = MAX(previousMax, MAX(leftObject, rightObject));
            
            myArray[index] = [NSString stringWithFormat:@"%ld", previousMax];
            
            myArray[(n.integerValue - index - 1)] = [NSString stringWithFormat:@"%ld", previousMax];
            
            if (leftObject != previousMax) {
                
                count += 1;
            }
            
            if (rightObject != previousMax) {
                
                count += 1;
            }
            
        }
        
    }
    
    return  (count == k.integerValue) ? [myArray componentsJoinedByString:@""] : @"-1";
}

@end
