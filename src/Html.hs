{-# LANGUAGE OverloadedStrings #-}

module Html where

import Data.ByteString.Lazy
import Data.Map hiding ((!))
import Data.Maybe
import Prelude hiding (lookup)

import Text.Blaze.Html5 as HTML
import Text.Blaze.Html5.Attributes as HTML hiding ( title, form)
import Text.Blaze.Html.Renderer.Utf8 as HTML

renderHTML :: HTML.Html -> ByteString
renderHTML html = HTML.renderHtml html

bingoRootHTML :: HTML.Html
bingoRootHTML = HTML.docTypeHtml $ do
    HTML.head $ do
      HTML.title "Bingoooooooooooooooo"
      HTML.meta ! HTML.charset "utf-8"
      link ! rel "stylesheet" ! href "styles.css"
      script ! type_ "text/javascript" ! src "home.js" $ mempty
    HTML.body $ do
      HTML.div ! HTML.id "content" $ do
        HTML.p $ "bingosanat, rivinvaihdolla eroteltuna"
        HTML.form ! HTML.action "/start" ! HTML.method "get" $ do 
          HTML.textarea ! HTML.name "sanat" $ HTML.text $ "Darcy itkee"
          HTML.p $ HTML.button $ "hit it!"

cardHTML :: (Map (Integer, Integer) String) -> HTML.Html
cardHTML cardMap = HTML.docTypeHtml $ do
    HTML.head $ do
      HTML.title "Bingoooooooooooooooo"
      HTML.meta ! HTML.charset "utf-8"
      link ! rel "stylesheet" ! href "styles.css"
      script ! type_ "text/javascript" ! src "start.js" $ mempty
    HTML.body $ do
      HTML.div ! HTML.id "content" $ do
        HTML.table $ do
            HTML.tbody $ do
                tableRow 1 cardMap
                tableRow 2 cardMap
                tableRow 3 cardMap
                tableRow 4 cardMap
                tableRow 5 cardMap

tableRow :: Integer -> Map (Integer, Integer) String -> HTML.Html
tableRow row cardMap = HTML.tr $ do
    HTML.td $ HTML.string $ fromJust $ lookup (row,1) cardMap
    HTML.td $ HTML.string $ fromJust $ lookup (row,2) cardMap
    HTML.td $ HTML.string $ fromJust $ lookup (row,3) cardMap
    HTML.td $ HTML.string $ fromJust $ lookup (row,4) cardMap
    HTML.td $ HTML.string $ fromJust $ lookup (row,5) cardMap


