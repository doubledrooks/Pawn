#import <Pawn/Pawn.h>


SpecBegin(ExampleSpec)

/* This is not an exhaustive list of usages.
   For more information, please visit https://github.com/doubledrooks/pawn */

describe(@"Example specs on NSString", ^{
    it(@"lowercaseString returns a new string with everything in lower case", ^{
        expect([@"DoubledRooks" lowercaseString]).to.equal(@"doubledrooks");
    });

    it(@"length returns the number of characters in the string", ^{
        expect([@"internationalization" length]).to.equal(20);
    });

    describe(@"isEqualToString:", ^{
        it(@"should return true if the strings are the same", ^{
            expect([@"thisString" isEqualToString:@"thisString"]).to.beTruthy();
        });

        it(@"should return false if the strings are not the same", ^{
            expect([@"thisString" isEqualToString:@"thatString"]).to.beFalsy();
        });
    });

    describe(@"NSMutableString", ^{
        it(@"should be a kind of NSString", ^{
            expect([NSMutableString string]).to.beKindOf([NSString class]);
        });
    });
});

SpecEnd
