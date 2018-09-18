//
//  IRPokemonController.h
//  PokeDexC
//
//  Created by Ivan Ramirez on 9/18/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface IRPokemonController : NSObject

//(^) this is a block/clousure
//SWIF:static func fetchPokemon(for searchTerm: String, completion:((Pokemon) -> ())?{
+ (void) fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^ _Nullable) (IRPokemon *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
