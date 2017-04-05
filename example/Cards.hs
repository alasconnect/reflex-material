{-# LANGUAGE OverloadedStrings #-}

module Cards where

import Data.Monoid ((<>))
import Reflex.Dom

import Reflex.Material.Card
import Reflex.Material.Typography

cards :: MonadWidget t m => m ()
cards = do
  title_ "Cards"
  card_ "div" mempty $ do
    cardPrimary_ "section" mempty $ do
      cardTitle_ "h1" mdcCardTitleLarge_ "Title"
      cardSubTitle_ "h2" mempty "Sub Title"
    cardSupportingText_ "section" mempty "Various text explaining things."
    cardActions_ "section" mempty $ do
      cardAction_ mempty "Action 1"
      cardAction_ mempty "Action 2"
