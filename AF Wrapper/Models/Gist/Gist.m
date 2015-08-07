//
//  Gist.m
//  
//
//  Created by Alexander Kozin on 12.07.15.
//
//

#import "Gist.h"

#import "AWModel.h"
#import "GistFile.h"

@interface Gist ()

@property (strong, nonatomic) NSMutableDictionary *files;

@end

@implementation Gist

- (NSMutableDictionary *)fullObject
{
    NSMutableDictionary *fullObject = [self objectForKeys:@[@"descr", @"files"]];
    fullObject[@"public"] = self.isPublic ? @"true" : @"false";

    return fullObject;
}

- (void)addFile:(GistFile *)gistFile
{
    if (gistFile) {
        NSMutableDictionary *files = self.files;
        if (!files) {
            files = [NSMutableDictionary dictionaryWithCapacity:1];
            [self setFiles:files];
        }
        files[gistFile.fileName] = gistFile;
    }
}

@end
