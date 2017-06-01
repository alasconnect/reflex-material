{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Checkbox
  ( checkbox'_
  ) where

import Data.Map
import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

checkbox'_ :: MonadWidget t m => Enabled -> Selected -> Text -> m (El t, ())
checkbox'_ e s v =
  elClass "div" (toClass e) $ do
    x <- elAttr' "input" ( disabledAttr e $
                           selectedAttr s $
                           checkboxAttrs v
                         ) blank
    elClass "div" "mdc-checkbox__background" $ do
      elAttr "svg" ("class" =: "mdc-checkbox__checkmark" <> "viewBox" =: "0 0 24 24") $
        elAttr "path" ("class" =: "mdc-checkbox__checkmark__path" <> "stroke" =: "white" <> "fill" =: "none" <> "d" =: "M1.73,12.91 8.1,19.28 22.79,4.59") blank
      elClass "div" "mdc-checkbox__mixedmark" blank
    return x

toClass :: Enabled -> Text
toClass Enabled = "mdc-checkbox"
toClass Disabled = "mdc-checkbox mdc-checkbox--disabled"

disabledAttr :: Enabled -> Map Text Text -> Map Text Text
disabledAttr Disabled m = m <> ("disabled" =: "disabled")
disabledAttr Enabled m = m

selectedAttr :: Selected -> Map Text Text -> Map Text Text
selectedAttr Selected m = m <> ("checked" =: "checked")
selectedAttr NotSelected m = m

checkboxAttrs :: Text -> Map Text Text
checkboxAttrs v = "value" =: v <>
                  "type" =: "checkbox" <>
                  "class" =: "mdc-checkbox__native-control"
