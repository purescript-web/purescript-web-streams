module Web.Streams.Reader where

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3)
import Web.Promise (Promise)

foreign import data Reader :: Type -> Type

foreign import _read :: forall chunk. EffectFn3 (forall a. Maybe a) (forall a. a -> Maybe a) (Reader chunk) (Promise (Maybe chunk))

read :: forall chunk. Reader chunk -> Effect (Promise (Maybe chunk))
read = runEffectFn3 _read Nothing Just