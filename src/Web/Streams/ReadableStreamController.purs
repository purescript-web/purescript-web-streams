module Web.Streams.ReadableStreamController where

import Effect (Effect)
import Effect.Exception (Error)
import Prelude (Unit)

foreign import data ReadableStreamController :: Type -> Type

foreign import enqueue :: forall chunk. chunk -> ReadableStreamController chunk -> Effect Unit

foreign import close :: forall chunk. ReadableStreamController chunk -> Effect Unit

foreign import error :: forall chunk. Error -> ReadableStreamController chunk -> Effect Unit

foreign import desiredSize :: forall chunk. ReadableStreamController chunk -> Effect Int