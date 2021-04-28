{-# LANGUAGE OverloadedStrings #-}

import Web.Spock as Spock
import Web.Spock.Config as Spock
import Data.Aeson as A

import Html

main :: IO ()
main = do
  spockCfg <- defaultSpockCfg () PCNoDatabase ()
  runSpock 3000 $ spock spockCfg $ do
    get root $ do
      Spock.lazyBytes bingoRootBytes
    get (root <//> var) $ \myInput ->
      Spock.html myInput
