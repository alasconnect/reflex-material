{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Basic
  ( Style(..)
  , defaultStyle
  , mobile_
  , stylesheet_
  , script_
  , scriptDo_
  , style_
  , styles_
  , img_
  , icon_
  , main_
  ) where

import Data.Monoid ((<>))
import Data.Text (Text, pack)
import Reflex.Dom

import Reflex.Material.Types
import Reflex.Material.Typography

data Style
  = Style
  { styleIcons :: [Text]
  , styleFonts :: [Text]
  , styleCss   :: [Text]
  }

defaultStyle :: Style
defaultStyle =
  Style [ "http://fonts.googleapis.com/icon?family=Material+Icons" ]
        [ "https://fonts.googleapis.com/css?family=Roboto:300,400,500" ]
        [ "https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" ]


mobile_ :: DomBuilder t m => m ()
mobile_ = elAttr "meta" m $ pure ()
  where
    m = "name"    =: "viewport"
     <> "content" =: "width=device-width, initial-scale=1.0"

stylesheet_ :: DomBuilder t m => Text -> m ()
stylesheet_ l = elAttr "link" ss $ pure ()
  where
    ss = "rel"  =: "stylesheet"
      <> "type" =: "text/css"
      <> "href" =: l

script_ :: MonadWidget t m => Text -> m ()
script_ src = elAttr "script" s $ pure ()
  where
    s = "type" =: "text/javascript"
     <> "src"  =: src

scriptDo_ :: DomBuilder t m => Text -> m ()
scriptDo_ = el "script" . text

style_ :: DomBuilder t m => Text -> m ()
style_ = el "style" . text

styles_ :: DomBuilder t m => Style -> m ()
styles_ ss =
  mapM_ stylesheet_ (concat [ styleIcons ss, styleFonts ss, styleCss ss ])

img_ :: DomBuilder t m => Img -> CssClass -> m ()
img_ (Img f w h a) (CssClass c) = 
  elAttr "img" (  "class"  =: c
               <> "src"    =: f
               <> "width"  =: (pack . show $ w)
               <> "height" =: (pack . show $ h)
               <> "alt"    =: a
               ) $ pure ()

icon_ :: DomBuilder t m => Text -> CssClass -> m ()
icon_ i c =
  elAttr "i" (  "class"       =: ("material-icons " <> unCssClass c)
             <> "aria-hidden" =: "true"
             ) $ text i

main_ :: MonadWidget t m => CssClass -> m a -> m ()
main_ t child =
  elClass "main" (unCssClass $ mdcTypography_ <> t) $ do
    _ <- child
    script_ "https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"
