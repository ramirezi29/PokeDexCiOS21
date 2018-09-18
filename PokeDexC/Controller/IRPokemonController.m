//
//  IRPokemonController.m
//  PokeDexC
//
//  Created by Ivan Ramirez on 9/18/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import "IRPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2";

@implementation IRPokemonController

+ (void) fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^ _Nullable) (IRPokemon *_Nullable))completion{
    //TWO Parts to every fetch function
    //1. Construct the URL
    NSURL *baseUrl = [[NSURL alloc] initWithString:baseURLString];
    NSURL *searchUrl = [[baseUrl URLByAppendingPathComponent:@"pokemon"] URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    NSLog(@"%@", [searchUrl absoluteString]);
    
    //2. DataTask, Serialize the Data, complete & resume
    [[[NSURLSession sharedSession] dataTaskWithURL:searchUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        
        if (error){
            
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        //404 page not fond example
        NSLog(@"%@", response);
        if (!data) {
            NSLog(@"No Data Returned from DataTask");
            completion (nil);
            return;
        }
        //The Happy Path
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        // if jsondictionary doesnt exist or any thing other than NSObject class
        if (! jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"error Parsing the json: %@", error);
            // need completion nill to avoid frustrations
            completion(nil);
            return;
        }
        IRPokemon *pokemon = [[IRPokemon alloc] initWithDictionary:jsonDictionary];
        completion(pokemon);
        
        //the resume is very easy to forget
    }]resume];
}

@end
