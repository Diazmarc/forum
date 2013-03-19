//
//  AwfulThreadPage.h
//  Awful
//
//  Copyright 2013 Awful Contributors. CC BY-NC-SA 3.0 US http://github.com/AwfulDevs/Awful
//

typedef enum {
    // Not sure what the last page is, but you want it.
    AwfulThreadPageLast = -2,
    
    // The first page that has unread posts.
    AwfulThreadPageNextUnread = -1,
    
    // An invalid thread page.
    AwfulThreadPageNone = 0,
    
    /* Implicitly include values for 1 to n, where n is the number of pages in the thread. */
} AwfulThreadPage;
