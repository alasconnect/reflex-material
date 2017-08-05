{-# LANGUAGE OverloadedStrings #-}

module Main where

-- import qualified Data.ByteString.Builder as B
import qualified Data.ByteString as BS
import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Basic
import Reflex.Material.Card
import Reflex.Material.Drawer
import Reflex.Material.List
import Reflex.Material.Toolbar
import Reflex.Material.Types

import Buttons
import Cards
import LayoutGrid
import Lists
import FormElement
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

nav :: DomBuilder t m => m (Event t (m ()))
nav = do
  (b1, _) <- btn "Buttons"
  (b2, _) <- btn "Cards"
  (b3, _) <- btn "Layout Grid"
  (b4, _) <- btn "List"
  (b5, _) <- btn "Typography"
  (b6, _) <- btn "Form Elements"
  pure $ leftmost [ buttons      <$ domEvent Click b1
                  , cards        <$ domEvent Click b2
                  , layoutGrid   <$ domEvent Click b3
                  , lists        <$ domEvent Click b4
                  , typography   <$ domEvent Click b5
                  , formElements <$ domEvent Click b6
                  ]
  where
    btn :: DomBuilder t m => Text -> m (Element EventResult (DomBuilderSpace m) t, ())
    btn t = do
      (e, _) <- elAttr' "span" mempty $ item_ "a" mempty $ do
        icon_ "lens" mdcListItemStartDetail_
        text t
      pure (e, ())

body_ :: (DomBuilder t m, MonadHold t m) => m ()
body_ = do
  toolbar
  elClass "div" (unCssClass $ CssClass "demo-content" <> mdcToolbarFixedAdjust_) $ do
    v <- drawer_ mdcPermanentDrawer_ $ drawerContent_ $ list_ "nav" mempty nav
    main_ (CssClass "demo-main") $ widgetHold buttons v

staticRendered :: IO ()
staticRendered = do
    (_, bldr) <- renderStatic $ do
        el "html" (return ())
        el "head" $ do
            head_
            script_ "all.js"
        el "body" body_
    BS.writeFile "index.html" bldr
