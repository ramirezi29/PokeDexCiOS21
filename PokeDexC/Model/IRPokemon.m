//
//  IRPokemon.m
//  PokeDexC
//
//  Created by Ivan Ramirez on 9/18/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import "IRPokemon.h"

@implementation IRPokemon



-(instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities {
    self = [super init]; // returning a IRPokemon
    if (self) { // that that worked, lets set our properties
        _name = name;
        _identifer = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation IRPokemon (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary{
    //subscript into the dictionary and use the id key to get the value of id
    NSInteger identifier = [dictionary[@"id"] integerValue];
    // to get into the dictionary
    
    NSString *name = dictionary[@"name"];
    // get into the array, abilities has a string literal
    //dictionary is the top level JSON
    NSArray *abilitiesDictionaries = dictionary[@"abilities"];
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionaries isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    //created this to get the last part of self initWithName:name idetnfi.... abilities *****
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    //for loop to get into the dictionary and get all the abilities in that dictionary
    for (NSDictionary *dictionary in abilitiesDictionaries){
        NSDictionary *nameDictionary = dictionary[@"ability"];
        NSString *abilityName = nameDictionary[@"name"];
        [abilities addObject:abilityName];
    }
  return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
