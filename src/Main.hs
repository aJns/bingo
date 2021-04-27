{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty

import Data.Monoid (mconcat)

main = scotty 3000 $ do
    get "/" $ file "./static/index.html"
    get "/bingo.jpg" $ file "./static/bingo.jpg"
