{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.IO.Class (liftIO)
import Data.Aeson as A
import Data.List
import Data.Text hiding (head, lines, intercalate)
import Web.Spock as Spock hiding (head)
import Web.Spock.Config as Spock

import Html
import Bingo
import Util

main :: IO ()
main = do
  spockCfg <- defaultSpockCfg () PCNoDatabase ()
  runSpock 3000 $ spock spockCfg $ do
    get root $ do
      Spock.lazyBytes bingoRootBytes
    get (root <//> "start") $ do
      sanat <- Spock.param' "sanat"
      sekotetut <- liftIO $ shuffleWords $ lines sanat
      let kortti = bingoFromList sekotetut
      Spock.lazyBytes $ cardBytes kortti
