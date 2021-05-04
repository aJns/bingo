module Util where

import Control.Monad.Random
import System.Random
import System.Random.Shuffle
import Data.Time.Clock.POSIX

shuffleWords :: [String] -> IO [String]
shuffleWords sanat = do
    let sanaLkm = length sanat
    unixtime <- getPOSIXTime
    let seed = round (1000 * unixtime)
    return $ shuffle' sanat sanaLkm (mkStdGen seed)
