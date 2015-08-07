//
//  GistFile.h
//  
//
//  Created by Alexander Kozin on 14.07.15.
//
//

#import "BaseModel.h"

@interface GistFile : BaseModel

@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *text;

@end
