#import "AWKQueueHelper.h"

@implementation NSMutableArray (Queue)

- (void)enqueue:(id)object {
  [self addObject: object];
}

- (id)dequeue {
  id queueObject = nil;

  if ([self lastObject]) {
    queueObject = [self objectAtIndex: 0];
    [self removeObjectAtIndex: 0];
  }

  return queueObject;
}

- (BOOL)empty {
  return ([self lastObject] == nil);
}

@end
