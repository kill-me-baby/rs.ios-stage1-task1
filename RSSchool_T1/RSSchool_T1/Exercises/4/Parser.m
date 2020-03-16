#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSDictionary* charDict = @{ @"(": @")", @"<": @">", @"[": @"]" };
    
    NSMutableArray<NSString*>* result = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < string.length; index++) {
        
        unichar currentChar = [string characterAtIndex:index];
        
        if (currentChar == '[' || currentChar == '(' || currentChar == '<') {
            
            NSMutableString* myString = [[NSMutableString alloc] init];
            
            NSInteger nextIndex = index + 1;
            
            NSInteger pass = 0;
            
            unichar nextChar = [string characterAtIndex:nextIndex];
            
            NSString* backwardChar = [NSString stringWithCharacters:&currentChar length:1];
            
            unichar closingChar = [charDict[backwardChar] characterAtIndex:0];
            
            while (nextChar != closingChar) {
                
                [myString appendFormat:@"%c", nextChar];
                
                nextChar = [string characterAtIndex: ++nextIndex];
                
                if (nextChar == currentChar)
                    
                    pass += 1;
                
                if (nextChar == closingChar && pass) {
                    
                    [myString appendFormat:@"%c", nextChar];
                    
                    nextChar = [string characterAtIndex: ++nextIndex];
                    
                    pass -= 1;
                }
            }
            
            [result addObject:myString];
        }
    }
    
    return result;
}

@end
