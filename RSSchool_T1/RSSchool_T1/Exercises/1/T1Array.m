#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    if (sadArray.count > 2) {
        
        NSMutableArray* happyArray = sadArray.mutableCopy;
        
        for (NSInteger index = 1; index < happyArray.count - 1; index++) {
            
            NSInteger sumOfLeftAndRightObjects = [happyArray[index - 1] integerValue] + [happyArray[index + 1] integerValue];
            
            if ([happyArray[index] integerValue] > sumOfLeftAndRightObjects) {
                
                [happyArray removeObjectAtIndex:index];
                
                index = 1;
            }
        }
        
        return happyArray;
    }
    
    return sadArray;
}

@end
