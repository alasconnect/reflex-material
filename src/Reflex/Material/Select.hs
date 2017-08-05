{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Select
  ( select'_
  ) where

import Data.Map
import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

-- <select class="mdc-select">
--   <option value="" default selected>Pick a food</option>
--   <option value="grains">Bread, Cereal, Rice, and Pasta</option>
--   <option class="mdc-list-divider" role="presentation" disabled />
--   <option value="vegetables">Vegetables</option>
--   <optgroup label="Fruits">
--     <option value="apple">Apple</option>
--     <option value="oranges">Orange</option>
--     <option value="banana">Banana</option>
--   </optgroup>
--   <option value="dairy">Milk, Yogurt, and Cheese</option>
--   <option value="meat">Meat, Poultry, Fish, Dry Beans, Eggs, and Nuts</option>
--   <option value="fats">Fats, Oils, and Sweets</option>
-- </select>

select'_ :: DomBuilder t m => Enabled -> [SelectOption] -> m (Element EventResult (DomBuilderSpace m) t, ())
select'_ e sos =
  elAttr' "select" (selectAttrs e) $
    mapM_ renderOption sos
  where
    renderOption o =
      case o of
        (Option e s d v l) -> elAttr "option" (disabledAttr e $ selectedAttr s $ defaultAttr d $ optionAttrs v) (text l)
        (Group e l sos')   -> elAttr "optgroup" (disabledAttr e $ optionGroupAttrs l) $
                                mapM_ renderOption sos'
        Divider            -> elAttr "option" (dividerAttrs) blank

disabledAttr :: Enabled -> Map Text Text -> Map Text Text
disabledAttr Disabled m = m <> ("disabled" =: "disabled")
disabledAttr Enabled m = m

selectedAttr :: Selected -> Map Text Text -> Map Text Text
selectedAttr Selected m = m <> ("selected" =: "selected")
selectedAttr NotSelected m = m

defaultAttr :: Default -> Map Text Text -> Map Text Text
defaultAttr Default m = m <> ("default" =: "default")
defaultAttr NotDefault m = m

selectAttrs :: Enabled -> Map Text Text
selectAttrs Enabled = "class" =: "mdc-select"
selectAttrs Disabled = "class" =: "mdc-select mdc-select--disabled" <>
                       "disabled" =: "disabled"

optionAttrs :: Text -> Map Text Text
optionAttrs v = "value" =: v <>
                "class" =: "mdc-list-item"

optionGroupAttrs :: Text -> Map Text Text
optionGroupAttrs l = "label" =: l <>
                     "class" =: "mdc-list-group"

dividerAttrs :: Map Text Text
dividerAttrs = "class" =: "mdc-list-divider" <>
               "role" =: "presentation" <>
               "disabled" =: "disabled"
