//
//  Gist.h
//  
//
//  Created by Alexander Kozin on 12.07.15.
//
//
//
#import "BaseModel.h"

@class GistFile;

@interface Gist : BaseModel

@property (nonatomic, getter=isPublic) BOOL publicGist;

- (void)addFile:(GistFile *)file;

@end
