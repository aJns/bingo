{-# LANGUAGE OverloadedStrings #-}

import Web.Spock as Spock hiding (head)
import Web.Spock.Config as Spock
import Data.Aeson as A
import Data.Text hiding (head, lines, intercalate)
import Data.List

import Html

main :: IO ()
main = do
  spockCfg <- defaultSpockCfg () PCNoDatabase ()
  runSpock 3000 $ spock spockCfg $ do
    get root $ do
      Spock.lazyBytes bingoRootBytes
    get (root <//> "start") $ do
      sanat <- Spock.param' "sanat"
      Spock.html $ pack $ intercalate " -- " $ lines sanat
