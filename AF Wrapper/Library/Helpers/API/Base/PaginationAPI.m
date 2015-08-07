//
//  PaginationAPI.m
//  
//
//  Created by Alexander Kozin on 12.07.15.
//
//

#import "PaginationAPI.h"
#import "API_Private.h"

NSUInteger const kAPIFirstPageNumber = 1;

@interface PaginationAPI ()

@property (nonatomic) NSUInteger page;
@property (nonatomic) BOOL isLastPage;

@end

@implementation PaginationAPI

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setObjectsPerPage:kAPIDefaultObjectsPerPage];
        [self resetToFirstPage];
    }
    return self;
}

- (void)sendRequestWithCompletion:(void (^)(id, NSError *, BOOL *))completion
{
    if (![self isLastPage]) {
        [super sendRequestWithCompletion:completion];
    } else {
        // Create custom error for out of bounds request
        NSError *e = [NSError errorWithDomain:@""
                                         code:NSIntegerMax
                                     userInfo:nil];

        [self apiDidFailWithError:e];
        [self apiDidEnd];
    }
}

- (NSMutableDictionary *)parameters
{
    NSMutableDictionary *parameters = [super parameters];
    parameters[@"page"] = @(self.page);
    parameters[@"per_page"] = @(self.objectsPerPage);

    return parameters;
}

- (void)setObjectsPerPage:(NSUInteger)objectsPerPage
{
    NSParameterAssert(objectsPerPage);

    _objectsPerPage = objectsPerPage;
}

- (BOOL)isFirstPage
{
    return self.page == kAPIFirstPageNumber;
}

- (void)requestFromFirstPage
{
    [self resetToFirstPage];
    [self requestNextPage];
}

- (void)requestNextPage
{
    [self sendRequestWithCompletion:self.completion];
}

- (void)resetToFirstPage
{
    [self setPage:kAPIFirstPageNumber];
    [self setIsLastPage:NO];
    [self setUserInfo:nil];
}

- (void)apiDidReturnReply:(NSArray *)reply source:(id)source
{
    [super apiDidReturnReply:reply source:source];

    [self didReciveObjects:[reply count]];
}

- (void)didReciveObjects:(NSUInteger)count
{
    self.page++;
    // Set isLastPage flag according to your protocol
    // For example may be setted when no next_page token provided
    // Or when count of new objects is less than
    [self setIsLastPage:count < self.objectsPerPage];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@, from:%lu, count:%lu", [super description], (unsigned long)self.page, (unsigned long)self.objectsPerPage];
}

@end
