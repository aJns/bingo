{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.IO.Class (liftIO)
import Data.Aeson as A
import Data.List
import Data.Text hiding (head, lines, intercalate)
import Network.Wai.Middleware.Static
import Web.Spock as Spock hiding (head)
import Web.Spock.Config as Spock

import Html
import Bingo
import Util

main :: IO ()
main = do
  spockCfg <- defaultSpockCfg () PCNoDatabase ()
  runSpock 3000 $ spock spockCfg $ do
    middleware $ staticPolicy (addBase "static")
    get root $ do
      Spock.lazyBytes $ renderHTML bingoRootHTML
    get (root <//> "start") $ do
      sanat <- Spock.param' "sanat"
      sekotetut <- liftIO $ shuffleWords $ lines sanat
      let kortti = bingoFromList sekotetut
      Spock.lazyBytes $ renderHTML $ cardHTML kortti
