#import <Foundation/Foundation.h>
#import "JsonEraEnd.h"
#import "ValidatorWeight.h"
#import "JsonEraReport.h"
@implementation JsonEraEnd
+(JsonEraEnd*) fromJsonDictToJsonEraEnd:(NSDictionary*) fromDict {
    JsonEraEnd * ret = [[JsonEraEnd alloc] init];
    if(![fromDict[@"next_era_validator_weights"] isEqual:[NSNull null]]) {
        ret.next_era_validator_weights = [[NSMutableArray alloc] init];
        NSArray * listValidatorWeight = (NSArray*) fromDict[@"next_era_validator_weights"];
        for(id obj in listValidatorWeight) {
            ValidatorWeight * oneVW = [[ValidatorWeight alloc] init];
            oneVW.validator = obj[@"validator"];
            oneVW.weight = [U512Class fromStrToClass:obj[@"weight"]];
            [ret.next_era_validator_weights addObject:oneVW];
        }
    }
    if(![fromDict[@"era_report"] isEqual:[NSNull null]]) {
        ret.era_report = [JsonEraReport fromJsonDictToJsonEraReport:fromDict[@"era_report"]];
    }
    return ret;
}
-(void) logInfo {
    NSLog(@"EraEnd,next_era_validator_weights size:%lu",(unsigned long)self.next_era_validator_weights.count);
    if(self.next_era_validator_weights.count>0) {
        ValidatorWeight * firstVW = self.next_era_validator_weights.firstObject;
        NSLog(@"EraEnd,next_era_validator_weights, first ValidatorWeight, validator:%@",firstVW.validator);
        NSLog(@"EraEnd,next_era_validator_weights, first ValidatorWeight, weight:%@",firstVW.weight.itsValue);
    }
    [self.era_report logInfo];
}
@end