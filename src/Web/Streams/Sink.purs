module Web.Streams.Sink
  ( Sink
  , Optional
  , make
  ) where

import Effect (Effect)
import Effect.Exception (Error)
import Prelude (Unit)
import Prim.Row as Row
import Web.Promise (Promise)
import Web.Streams.WritableStreamController (WritableStreamController)

type Optional chunk =
  ( start :: WritableStreamController chunk -> Effect (Promise Unit)
  , write :: chunk -> WritableStreamController chunk -> Effect (Promise Unit)
  , close :: WritableStreamController chunk -> Effect (Promise Unit)
  , abort :: Error -> Effect (Promise Unit)
  )

foreign import data Sink :: Type -> Type

make :: forall r rx chunk. Row.Union r rx (Optional chunk) => { | r } -> Sink chunk
make = _make

foreign import _make :: forall r chunk. { | r } -> Sink chunk
