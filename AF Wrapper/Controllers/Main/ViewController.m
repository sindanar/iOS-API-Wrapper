//
//  ViewController.m
//  AF Wrapper
//
//  Created by Alexander Kozin on 08.07.15.
//  Copyright (c) 2015 Siberian.pro. All rights reserved.
//

#import "ViewController.h"

#import "AddGistAPI.h"
#import "iOSRepositoriesAPI.h"
#import "GistFile.h"
#import "LocationGetAPI.h"
#import "LocationModel.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //[self sendGist:nil];
    //[self loadiOSRepos:nil];
    [self loadLocation:nil];
}

- (IBAction)loadLocation:(id)sender
{
    [LocationGetAPI withCompletion:^(id response, NSError *error, BOOL *handleError) {
        if (!error) {
            LocationModel *location = response;
            //NSLog(@"latitude - %f", location.coordinates.latitude);
            //NSLog(@"longtude - %f", location.coordinates.longitude);
            NSLog(@"#latitude:%f", location.location.latitude);
            NSLog(@"#latitude:%f", location.location.longitude);

        }
            }];
}

- (IBAction)loadiOSRepos:(id)sender
{
    [iOSRepositoriesAPI withCompletion:^(NSArray *repos, NSError *error, BOOL *handleError) {
        NSLog(@"#iOS Repos:\n%@", repos);
    }];
}

- (IBAction)sendGist:(id)sender
{
    GistFile *file = [GistFile new];
    [file setFileName:@"File1.txt"];
    [file setText:@"Hello, Habr!"];

    GistFile *file2 = [GistFile new];
    [file2 setFileName:@"File2.txt"];
    [file2 setText:@"Foo bar"];

    Gist *gist = [Gist new];
    [gist setPublicGist:YES];
    [gist setDescr:@"Sample private gist"];
    [gist addFile:file];
    [gist addFile:file2];

    [AddGistAPI withObject:gist completion:^(id reply, NSError *error, BOOL *handleError) {
        if (error) {
            NSLog(@"#Gist adding error: %@", error);
        } else {
            NSLog(@"#Gist added: %@", reply);
        }
    }];
}
@end
