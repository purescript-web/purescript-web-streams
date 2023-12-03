module Web.Streams.WritableStream
  ( WritableStream
  , new
  , abort
  , abortErr
  , close
  , getWriter
  , locked
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Exception (Error)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Prelude (Unit)
import Web.Promise (Promise)
import Web.Streams.QueuingStrategy (QueuingStrategy)
import Web.Streams.Sink (Sink)
import Web.Streams.Writer (Writer)

foreign import data WritableStream :: Type -> Type

foreign import _new :: forall chunk. EffectFn2 (Nullable (Sink chunk)) (Nullable (QueuingStrategy chunk)) (WritableStream chunk)

new :: forall chunk. Maybe (Sink chunk) -> Maybe (QueuingStrategy chunk) -> Effect (WritableStream chunk)
new source strategy = runEffectFn2 _new (toNullable source) (toNullable strategy)

foreign import _abortErr :: forall chunk. EffectFn2 (WritableStream chunk) Error (Promise Error)

abortErr :: forall chunk. WritableStream chunk -> Error -> Effect (Promise Error)
abortErr = runEffectFn2 _abortErr

foreign import abort :: forall chunk. WritableStream chunk -> Effect (Promise Unit)

foreign import close :: forall chunk. WritableStream chunk -> Effect (Promise Unit)

foreign import getWriter :: forall chunk. WritableStream chunk -> Effect (Writer chunk)

foreign import locked :: forall chunk. WritableStream chunk -> Effect Boolean
