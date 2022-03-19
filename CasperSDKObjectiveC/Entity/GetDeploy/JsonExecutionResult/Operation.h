#ifndef Operation_h
#define Operation_h
@interface Operation:NSObject
@property NSString * key;
///Value of type enum OpKind, which can be among 1 of the 4 possible values:
///Read,Write,Add,NoOp
///Saved as String of 4 possible corresponding values
@property NSString * kind;

@end

#endif