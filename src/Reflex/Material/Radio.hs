{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Radio
  ( radio'_
  ) where

import Data.Map
import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

radio'_ :: DomBuilder t m => Enabled -> Selected -> Text -> Text -> m (Element EventResult (DomBuilderSpace m) t, ())
radio'_ e s n v =
  elClass "div" (toClass e) $ do
    x <- elAttr' "input" ( disabledAttr e $
                           selectedAttr s $
                           radioAttrs n v
                         ) blank
    elClass "div" "mdc-radio__background" $ do
      elClass "div" "mdc-radio__outer-circle" blank
      elClass "div" "mdc-radio__inner-circle" blank
    return x

toClass :: Enabled -> Text
toClass Enabled = "mdc-radio"
toClass Disabled = "mdc-radio mdc-radio--disabled"

disabledAttr :: Enabled -> Map Text Text -> Map Text Text
disabledAttr Disabled m = m <> ("disabled" =: "disabled")
disabledAttr Enabled m = m

selectedAttr :: Selected -> Map Text Text -> Map Text Text
selectedAttr Selected m = m <> ("checked" =: "checked")
selectedAttr NotSelected m = m

radioAttrs :: Text -> Text -> Map Text Text
radioAttrs n v = "name" =: n <>
                 "value" =: v <>
                 "type" =: "radio" <>
                 "class" =: "mdc-radio__native-control"
