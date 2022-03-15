#import <Foundation/Foundation.h>
#import "JsonBlockHeader.h"
@implementation JsonBlockHeader
+(JsonBlockHeader*) fromJsonDictToJsonBlockHeader:(NSDictionary*) fromDict {
    JsonBlockHeader * ret = [[JsonBlockHeader alloc] init];
    ret.parent_hash = fromDict[@"parent_hash"];
    ret.state_root_hash = fromDict[@"state_root_hash"];
    ret.body_hash = fromDict[@"body_hash"];
    ret.random_bit = [fromDict[@"random_bit"] boolValue];
    ret.accumulated_seed = fromDict[@"accumulated_seed"];
    ret.timestamp = fromDict[@"timestamp"];
    NSString * era_idStr = fromDict[@"era_id"];
    NSString * heightStr = fromDict[@"height"];
    ret.era_id = [era_idStr longLongValue];
    ret.height = [heightStr longLongValue];
    ret.protocol_version = fromDict[@"protocol_version"];
    ret.is_era_end_exists = true;
    if(![fromDict[@"era_end"] isEqual:[NSNull null]]) {
        ret.era_end = [[JsonEraEnd alloc] init];
        ret.era_end = [JsonEraEnd fromJsonDictToJsonEraEnd:fromDict[@"era_end"]];
    } else {
        ret.is_era_end_exists = false;
    }
    return ret;
}
-(void) logInfo{
    NSLog(@"JsonBlockHeader, parent_hash:%@",self.parent_hash);
    NSLog(@"JsonBlockHeader, state_root_hash:%@",self.state_root_hash);
    NSLog(@"JsonBlockHeader,body_hash:%@",self.body_hash);
    NSLog(@"JsonBlockHeader, random_bit:%d",self.random_bit);
    NSLog(@"JsonBlockHeader,accumulated_seed:%@",self.accumulated_seed);
    NSLog(@"JsonBlockHeader,timestamp:%@",self.timestamp);
    NSLog(@"JsonBlockHeader,era_id:%llu",self.era_id);
    NSLog(@"JsonBlockHeader,height:%llu",self.height);
    NSLog(@"JsonBlockHeader,protocol_version:%@",self.protocol_version);
    if(_is_era_end_exists) {
        [self.era_end logInfo];
    } else {
        NSLog(@"JsonBlockHeader,era_end: <null>");
    }
}
@end