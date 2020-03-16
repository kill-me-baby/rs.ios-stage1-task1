#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSMutableArray<NSNumber*>* myArray = array.mutableCopy;
    
    NSArray<NSNumber*>* result = [[NSArray alloc] init];
    
    NSInteger summElements = 0;
    
    NSMutableArray<NSNumber*>* amounts = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < array.count; index++) {
        
        [myArray removeObjectAtIndex:index];
        
        for (NSNumber* element in myArray) {
            
            summElements += element.integerValue;
        }
        
        [amounts addObject:[NSNumber numberWithInteger:summElements]];
        
        summElements = 0;
        
        myArray = array.mutableCopy;
    }
    
    NSNumber* maxNumber = [amounts valueForKeyPath:@"@max.self"];
    
    NSNumber* minNumber = [amounts valueForKeyPath:@"@min.self"];
    
    result = [NSArray arrayWithObjects:minNumber, maxNumber, nil];
    
    return result;
}

@end
