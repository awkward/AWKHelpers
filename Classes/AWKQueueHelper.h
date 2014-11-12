#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)

/**
  Queues an object at the end of the queue.

  @param object The object to be queued.
 */
- (void)enqueue:(id)object;

/**
  Removes the first item from the queue.

  @return Returns the first object in the queue, if not empty.
 */
- (id)dequeue;

/**
  Checks if the queue contains any objects.

  @return Returns YES if the queue is empty
 */
- (BOOL)empty;

@end
