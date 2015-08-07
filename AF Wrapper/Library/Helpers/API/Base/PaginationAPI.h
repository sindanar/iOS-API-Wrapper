//
//  PaginationAPI.h
//  
//
//  Created by Alexander Kozin on 12.07.15.
//
//

#import "GetAPI.h"

@interface PaginationAPI : GetAPI

@property (nonatomic, readonly) NSUInteger page;
@property (nonatomic) NSUInteger objectsPerPage;

@property (nonatomic, readonly) BOOL isFirstPage, isLastPage;

// Requests next page of objects
- (void)requestNextPage;

// Resets API to first page and requests next page
- (void)requestFromFirstPage;

// Resets API to first page
- (void)resetToFirstPage;

@end
