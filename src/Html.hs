{-# LANGUAGE OverloadedStrings #-}

module Html where

import Data.ByteString.Lazy
import Data.Map hiding ((!))
import Data.Maybe
import Prelude hiding (lookup)

import Text.Blaze.Html5 as HTML
import Text.Blaze.Html5.Attributes as HTML hiding ( title, form)
import Text.Blaze.Html.Renderer.Utf8 as HTML

bingoRootHTML :: HTML.Html
bingoRootHTML = HTML.docTypeHtml $ do
    HTML.head $ do
      HTML.title "Bingoooooooooooooooo"
      HTML.meta ! HTML.charset "utf-8"
      link ! rel "stylesheet" ! href "styles.css"
    HTML.body $ do
      HTML.div ! HTML.id "content" $ do
        HTML.p $ "bingosanat, rivinvaihdolla eroteltuna"
        HTML.form ! HTML.action "/start" ! HTML.method "get" $ do 
          HTML.textarea ! HTML.name "sanat" $ HTML.text $ "Darcy itkee"
          HTML.p $ HTML.button $ "hit it!"

bingoRootBytes :: ByteString
bingoRootBytes = HTML.renderHtml bingoRootHTML

cardHTML :: (Map (Integer, Integer) String) -> HTML.Html
cardHTML cardMap = HTML.docTypeHtml $ do
    HTML.head $ do
      HTML.title "Bingoooooooooooooooo"
      HTML.meta ! HTML.charset "utf-8"
      link ! rel "stylesheet" ! href "styles.css"
    HTML.body $ do
      HTML.div ! HTML.id "content" $ do
        HTML.table $ do
            HTML.tbody $ do
                HTML.tr $ do
                  HTML.td $ HTML.string $ fromJust $ lookup (1,1) cardMap
                  HTML.td $ HTML.string $ fromJust $ lookup (1,2) cardMap
                HTML.tr $ do
                  HTML.td $ HTML.string $ fromJust $ lookup (1,3) cardMap
                  HTML.td $ HTML.string $ fromJust $ lookup (1,4) cardMap

cardBytes :: (Map (Integer, Integer) String) -> ByteString
cardBytes cardMap = HTML.renderHtml $ cardHTML cardMap
