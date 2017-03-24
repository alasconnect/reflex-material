{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Monoid ((<>))
import Reflex.Dom

import Reflex.Material.Basic
import Reflex.Material.Drawer
import Reflex.Material.List
import Reflex.Material.Toolbar
import Reflex.Material.Types

import Buttons
import LayoutGrid
import Lists
import Toolbar
import Typography

main :: IO ()
main = mainWidgetWithHead head_ body_

head_ :: DomBuilder t m => m ()
head_ = do
  el "title" $ text "Example Reflex-Material"
  mobile_
  styles_ defaultStyle
  stylesheet_ "css/example.css"

nav :: MonadWidget t m => m (Event t (m ()))
nav = do
  (b1, _0) <- elAttr' "span" mempty $ item_ "a" mempty $ do
    icon_ "lens" mdcListItemStartDetail_
    text "Buttons"
  (b2, _0) <- elAttr' "span" mempty $ item_ "a" mempty $ do
    icon_ "lens" mdcListItemStartDetail_
    text "Layout Grid"
  (b3, _0) <- elAttr' "span" mempty $ item_ "a" mempty $ do
    icon_ "lens" mdcListItemStartDetail_
    text "List"
  (b4, _0) <- elAttr' "span" mempty $ item_ "a" mempty $ do
    icon_ "lens" mdcListItemStartDetail_
    text "Typography"
  pure $ leftmost [ buttons    <$ domEvent Click b1
                  , layoutGrid <$ domEvent Click b2
                  , lists      <$ domEvent Click b3
                  , typography <$ domEvent Click b4
                  ]

body_ :: MonadWidget t m => m ()
body_ = do
  toolbar
  elClass "div" (unCssClass $ CssClass "demo-content" <> mdcToolbarFixedAdjust_) $ do
    v <- drawer_ mdcPermanentDrawer_ $ drawerContent_ $ list_ "nav" mempty nav
    main_ (CssClass "demo-main") $ widgetHold buttons v
