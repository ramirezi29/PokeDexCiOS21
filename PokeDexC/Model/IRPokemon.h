//
//  IRPokemon.h
//  PokeDexC
//
//  Created by Ivan Ramirez on 9/18/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifer;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;


-(instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities;

@end

@interface IRPokemon(JSONConvertable) // this is the extension

//the value is a (NSString) string and the value (id) is Any.
//init(dictionary: [String: Any]
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
