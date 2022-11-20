module Web.Streams.ReadableStream
  ( ReadableStream
  , new
  , cancel
  , locked
  , getReader
  , tee
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Prelude (Unit)
import Promise (Promise)
import Web.Streams.QueuingStrategy (QueuingStrategy)
import Web.Streams.Reader (Reader)
import Web.Streams.Source (Source)

foreign import data ReadableStream :: Type -> Type

foreign import _new :: forall chunk. EffectFn2 (Source chunk) (Nullable (QueuingStrategy chunk)) (ReadableStream chunk)

foreign import cancel :: forall chunk. ReadableStream chunk -> Effect (Promise Unit)

foreign import locked :: forall chunk. ReadableStream chunk -> Effect Boolean

foreign import getReader :: forall chunk. ReadableStream chunk -> Effect (Reader chunk)

foreign import _tee :: forall chunk. EffectFn2 (forall a b. a -> b -> Tuple a b) (ReadableStream chunk) (Tuple (ReadableStream chunk) (ReadableStream chunk))

new :: forall chunk. Source chunk -> Maybe (QueuingStrategy chunk) -> Effect (ReadableStream chunk)
new source strategy = runEffectFn2 _new source (toNullable strategy)

tee :: forall chunk. ReadableStream chunk -> Effect (Tuple (ReadableStream chunk) (ReadableStream chunk))
tee = runEffectFn2 _tee Tuple