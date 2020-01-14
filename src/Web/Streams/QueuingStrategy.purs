module Web.Streams.QueuingStrategy where

import Data.ArrayBuffer.Types (Uint8Array)
import Effect (Effect)

foreign import data QueuingStrategy :: Type -> Type

foreign import new :: forall chunk. { size :: chunk -> Int, highWaterMark :: Int } -> Effect (QueuingStrategy chunk)

foreign import byteLengthQueuingStrategy :: { highWaterMark :: Int } -> Effect (QueuingStrategy Uint8Array)

foreign import countQueuingStrategy :: forall a. { highWaterMark :: Int } -> Effect (QueuingStrategy a)