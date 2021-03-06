//  FISAppDelegate.m

#import "FISAppDelegate.h"
@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSArray *middleEarthers = @[ @{ @"name"   : @"Bilbo"  ,
                                    @"age"    : @50       ,
                                    @"height" : @1.27     } ,
                                 @{ @"name"   : @"Thorin" ,
                                    @"age"    : @195      ,
                                    @"height" : @1.49     } ,
                                 @{ @"name"   : @"Balin"  ,
                                    @"age"    : @178      ,
                                    @"height" : @1.38     } ,
                                 @{ @"name"   : @"Dwalin" ,
                                    @"age"    : @169      ,
                                    @"height" : @1.50     } ,
                                 @{ @"name"   : @"Bifur"  ,
                                    @"age"    : @155      ,
                                    @"height" : @1.35     } ,
                                 
                                 @{ @"name"   : @"Bofur"  ,
                                    @"age"    : @155      ,
                                    @"height" : @1.45     } ,
                                 @{ @"name"   : @"Bombur" ,
                                    @"age"    : @155      ,
                                    @"height" : @1.35     } ,
                                 @{ @"name"   : @"Fíli"   ,
                                    @"age"    : @82       ,
                                    @"height" : @1.35     } ,
                                 @{ @"name"   : @"Kíli"   ,
                                    @"age"    : @77       ,
                                    @"height" : @1.43     } ,
                                 @{ @"name"   : @"Glóin"  ,
                                    @"age"    : @158      ,
                                    @"height" : @1.41     } ,
                                 
                                 @{ @"name"   : @"Óin"    ,
                                    @"age"    : @167      ,
                                    @"height" : @1.45     } ,
                                 @{ @"name"   : @"Dori"   ,
                                    @"age"    : @155      ,
                                    @"height" : @1.36     } ,
                                 @{ @"name"   : @"Ori"    ,
                                    @"age"    : @155      ,
                                    @"height" : @1.35     } ,
                                 @{ @"name"   : @"Gandalf",
                                    @"age"    : @2019     ,
                                    @"height" : @1.80     }
                                 ];
    
    
    NSPredicate *tallPredicate = [NSPredicate predicateWithFormat:@"height >= 1.45"];
    NSArray *tallCharacters = [middleEarthers filteredArrayUsingPredicate:tallPredicate];
    NSLog(@"%@",tallPredicate);
    
    for (NSDictionary *character in tallCharacters) {
        NSLog(@"%@ is %@ meters tall.", character[@"name"], character[@"height"]);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    NSMutableDictionary *mJenny = [ @{ @"first_name"       : @"Jenny",
                                       @"relationship"     : @"Friend",
                                       @"phone_number"     : @"(555) 867-5309",
                                       @"email_address"    : @"jenny@email.com",
                                       @"physical_address" : @"123 Street Name",
                                       @"city_state"       : @"Anywhere, USA",
                                       @"zip_code"         : @"00409"        }
                                   mutableCopy ];
    [mJenny setObject:@"Curran" forKey:@"last_name"];
    [mJenny removeObjectForKey:@"phone_number"];
    
    for (NSString *key in [mJenny allKeys]) { //MUST USE allKeys to loop through mutableDictionary if you want to edit it
        if ([key isEqualToString:@"relationship"]) {
            mJenny[@"relationship"] = @"Friend";
        }
    }
    
    
    NSString *palindrome = @"palindrome";
    NSString *reversed = [self stringByReversingString:palindrome];
    NSLog(@"%@, %@", palindrome, reversed);
    
    NSString *racecar = @"racecar";
    bool racecarIsPalindrome = [self stringIsPalindrome:racecar];
    NSLog(@"%d : %@",racecarIsPalindrome, racecar);
    
    NSString *bob = @"never odd or even";
    bool bobIsPalindrome = [self stringIsPalindrome:bob];
    NSLog(@"%d : %@",bobIsPalindrome, bob);
    
    NSString *fleeToMe = @"Flee to me, remote elf.";
    bool fleeIsPalindrome = [self stringIsPalindrome:fleeToMe];
    NSLog(@"%d : %@",fleeIsPalindrome,fleeToMe);
    
    NSString *eek = @"";
    
    while (eek.length <10) {
        eek = [eek stringByAppendingString:@"e"];
    }
    eek = [eek stringByAppendingString:@"k"];
    NSLog(@"%@",eek);
    NSUInteger dieRoll = 0;
    NSUInteger rollTotal = 0;
    
    do {
        dieRoll = 1 + arc4random_uniform(6);
        rollTotal += dieRoll;
        
        NSLog(@"Rolled a %lu", dieRoll);
        
    } while (dieRoll > 1);
    
    NSLog(@"Total score: %lu", rollTotal);
    return YES;
}


- (BOOL)stringIsPalindrome:(NSString *)string{
    NSArray *punctuations = @[@".",@",",@"!",@"?",@":",@";"];
   
    for (NSUInteger i =0; i<[punctuations count]; i++) {
        NSString *punctuation = punctuations[i];
        string = [string stringByReplacingOccurrencesOfString:punctuation withString:@""];
        
    }
    
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *reverse = [self stringByReversingString:string];
    reverse = [reverse lowercaseString];
    string = [string lowercaseString];
    
    BOOL stringIsEqualToReverse = [reverse isEqualToString:string];
    
    
    return stringIsEqualToReverse;
}


- (NSString *)stringByReversingString:(NSString *)string{
    
    NSString *result = @"";
    
    for (NSUInteger i = [string length];i>0; i--) {
        NSUInteger index = i-1;
        unichar c = [string characterAtIndex:index];
        result = [result stringByAppendingFormat:@"%C",c];
    }
    return result;
}




@end
