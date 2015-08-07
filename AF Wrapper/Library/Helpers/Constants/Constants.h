//
//  Constants.h
//
//  Created by Alexander Kozin on 2/2/12.
//  Copyright (c) 2012 Cookie. All rights reserved.

#define PRODUCTION_SERVER                       0
#if ! PRODUCTION_SERVER
    #define DEBUG_MODE                          1
    #if DEBUG_MODE
        #define PRINT_RESPONSE_TO_CONSOLE       1
        #define PRINT_REQUEST_TO_CONSOLE        1
    #endif
#endif

// API
FOUNDATION_EXPORT NSUInteger const kAPIDefaultObjectsPerPage;

FOUNDATION_EXPORT NSString *const kAPIBaseURL,
*const kAPIiOSRepositoriesURL,
*const kAPIGistsURL;


