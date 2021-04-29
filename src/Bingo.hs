module Bingo where

import Data.Map.Strict

bingoFromList :: [String] -> Map (Integer, Integer) String
bingoFromList words = do
    let cardSide = [1..5]
    let card = [(x,y) | x <- cardSide, y <- cardSide]
    fromList $ zip card words
