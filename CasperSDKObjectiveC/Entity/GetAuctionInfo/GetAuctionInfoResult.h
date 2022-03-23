#ifndef GetAuctionInfoResult_h
#define GetAuctionInfoResult_h
#import "AuctionState.h"
@interface GetAuctionInfoResult:NSObject
@property NSString * api_version;
@property AuctionState * auction_state;
+(GetAuctionInfoResult*) fromJsonDictToGetBalanceResult:(NSDictionary*) fromDict;
-(void) logInfo;
@end

#endif 
