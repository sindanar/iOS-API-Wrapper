//
//  User.h
//  
//
//  Created by Alexander Kozin on 11.07.15.
//
//

#import "BaseModel.h"

@interface User : BaseModel

@property (copy, nonatomic) NSString *organizationsUrl;
@property (copy, nonatomic) NSString *receivedEventsUrl;
@property (copy, nonatomic) NSString *followingUrl;
@property (copy, nonatomic) NSString *login;
@property (copy, nonatomic) NSString *avatarUrl;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *subscriptionsUrl;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *reposUrl;
@property (copy, nonatomic) NSString *htmlUrl;
@property (copy, nonatomic) NSString *eventsUrl;
@property (copy, nonatomic) NSString *starredUrl;
@property (copy, nonatomic) NSString *gistsUrl;
@property (copy, nonatomic) NSString *followersUrl;

@end
