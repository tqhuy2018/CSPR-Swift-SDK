#ifndef GetPeerResult_h
#define GetPeerResult_h

@interface GetPeerResult:NSObject
@property NSString* api_version;
@property NSMutableArray * PeersMap;
-(void) setupFrom:(NSString*) apiVersion andPeerMap:(NSMutableArray*) peerMapList;
@end

#endif 
