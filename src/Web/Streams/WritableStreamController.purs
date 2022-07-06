module Web.Streams.WritableStreamController where

import Effect (Effect)
import Effect.Exception (Error)
import Prelude (Unit)

foreign import data WritableStreamController :: Type -> Type

foreign import error :: forall chunk. WritableStreamController chunk -> Error -> Effect Unit
