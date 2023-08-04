module Web.Streams.Source
  ( Source
  , make
  ) where

import Effect (Effect)
import Prelude (Unit)
import Prim.Row as Row
import Promise (Promise)
import Web.Streams.ReadableStreamController (ReadableStreamController)

foreign import data Source :: Type -> Type

type Required chunk r =
  ( start :: ReadableStreamController chunk -> Effect (Promise Unit)
  | r
  )

type Optional chunk =
  ( pull :: ReadableStreamController chunk -> Effect (Promise Unit)
  , cancel :: Effect (Promise Unit)
  )

foreign import _make :: forall r chunk. { | r } -> Source chunk

make :: forall r rx chunk. Row.Union r rx (Optional chunk) => { | Required chunk r } -> Source chunk
make = _make