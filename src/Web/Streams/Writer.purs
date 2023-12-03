module Web.Streams.Writer
  ( Writer
  , abort
  , abortErr
  , close
  , closed
  , desiredSize
  , ready
  , write
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Data.Nullable as Nullable
import Effect (Effect)
import Effect.Exception (Error)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Web.Promise (Promise)

foreign import data Writer :: Type -> Type

foreign import _write :: forall chunk. EffectFn2 (Writer chunk) chunk (Promise Unit)

write :: forall chunk. Writer chunk -> chunk -> Effect (Promise Unit)
write = runEffectFn2 _write

foreign import ready :: forall chunk. Writer chunk -> Effect (Promise Unit)

foreign import close :: forall chunk. Writer chunk -> Effect (Promise Unit)

foreign import closed :: forall chunk. Writer chunk -> Effect (Promise Unit)

foreign import _desiredSize :: forall chunk. Writer chunk -> Effect (Nullable Int)

desiredSize :: forall chunk. Writer chunk -> Effect (Maybe Int)
desiredSize = map (Nullable.toMaybe) <<< _desiredSize

foreign import releaseLock :: forall chunk. Writer chunk -> Effect Unit

foreign import abort :: forall chunk. Writer chunk -> Promise (Effect Unit)

foreign import _abortErr :: forall chunk. EffectFn2 (Writer chunk) Error (Promise Error)

abortErr :: forall chunk. Writer chunk -> Error -> Effect (Promise Error)
abortErr = runEffectFn2 _abortErr
