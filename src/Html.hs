{-# LANGUAGE OverloadedStrings #-}

module Html where

import Data.ByteString.Lazy

import Text.Blaze.Html5 as HTML
import Text.Blaze.Html5.Attributes as HTML hiding ( title, form)
import Text.Blaze.Html.Renderer.Utf8 as HTML

bingoRootHTML :: HTML.Html
bingoRootHTML = HTML.html $
  HTML.docTypeHtml $ do
    HTML.head $ do
      HTML.title "Bingoooooooooooooooo"
      HTML.meta ! HTML.charset "utf-8"
    HTML.body $ do
      HTML.div ! HTML.id "content" $ do
        HTML.p $ "bingosanat, rivinvaihdolla eroteltuna"
        HTML.form ! HTML.action "/start" ! HTML.method "get" $ do 
          HTML.textarea ! HTML.name "sanat" $ HTML.text $ "Darcy itkee"
          HTML.p $ HTML.button $ "hit it!"

bingoRootBytes :: ByteString
bingoRootBytes = HTML.renderHtml bingoRootHTML
