//
//  Repo.h
//  
//
//  Created by Alexander Kozin on 10.07.15.
//
//

#import "BaseModel.h"

#import "User.h"

@interface Repo : BaseModel

@property (copy, nonatomic) NSString *keysUrl;
@property (copy, nonatomic) NSString *statusesUrl;
@property (copy, nonatomic) NSString *issuesUrl;
@property (copy, nonatomic) NSString *defaultBranch;
@property (copy, nonatomic) NSString *issueEventsUrl;
@property (copy, nonatomic) NSNumber *score;
@property (copy, nonatomic) NSString *eventsUrl;
@property (copy, nonatomic) NSString *subscriptionUrl;
@property (copy, nonatomic) NSNumber *watchers;
@property (copy, nonatomic) NSString *gitCommitsUrl;
@property (copy, nonatomic) NSString *subscribersUrl;
@property (copy, nonatomic) NSString *cloneUrl;
@property (copy, nonatomic) NSNumber *hasWiki;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *pullsUrl;
@property (copy, nonatomic) NSString *notificationsUrl;
@property (copy, nonatomic) NSString *collaboratorsUrl;
@property (copy, nonatomic) NSString *languagesUrl;
@property (copy, nonatomic) NSNumber *hasIssues;
@property (copy, nonatomic) NSString *commentsUrl;
@property (copy, nonatomic) NSNumber *size;
@property (copy, nonatomic) NSString *gitTagsUrl;
@property (copy, nonatomic) NSString *updatedAt;
@property (copy, nonatomic) NSString *sshUrl;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *contentsUrl;
@property (copy, nonatomic) NSString *archiveUrl;
@property (copy, nonatomic) NSString *milestonesUrl;
@property (copy, nonatomic) NSString *blobsUrl;
@property (copy, nonatomic) NSString *contributorsUrl;
@property (copy, nonatomic) NSNumber *openIssuesCount;
@property (copy, nonatomic) NSNumber *forksCount;
@property (copy, nonatomic) NSString *treesUrl;
@property (copy, nonatomic) NSString *svnUrl;
@property (copy, nonatomic) NSString *commitsUrl;
@property (copy, nonatomic) NSString *createdAt;
@property (copy, nonatomic) NSString *forksUrl;
@property (copy, nonatomic) NSNumber *hasDownloads;
@property (copy, nonatomic) NSString *homepage;
@property (copy, nonatomic) NSString *teamsUrl;
@property (copy, nonatomic) NSString *branchesUrl;
@property (copy, nonatomic) NSString *issueCommentUrl;
@property (copy, nonatomic) NSString *mergesUrl;
@property (copy, nonatomic) NSString *gitRefsUrl;
@property (copy, nonatomic) NSString *gitUrl;
@property (copy, nonatomic) NSNumber *forks;
@property (copy, nonatomic) NSNumber *openIssues;
@property (copy, nonatomic) NSString *hooksUrl;
@property (copy, nonatomic) NSString *htmlUrl;
@property (copy, nonatomic) NSString *stargazersUrl;
@property (copy, nonatomic) NSString *assigneesUrl;
@property (copy, nonatomic) NSString *compareUrl;
@property (copy, nonatomic) NSString *fullName;
@property (copy, nonatomic) NSString *tagsUrl;
@property (copy, nonatomic) NSString *releasesUrl;
@property (copy, nonatomic) NSString *pushedAt;
@property (copy, nonatomic) NSString *labelsUrl;
@property (copy, nonatomic) NSString *downloadsUrl;
@property (copy, nonatomic) NSNumber *stargazersCount;
@property (copy, nonatomic) NSNumber *watchersCount;
@property (copy, nonatomic) NSString *language;

@property (strong, nonatomic) User *owner;

@end
