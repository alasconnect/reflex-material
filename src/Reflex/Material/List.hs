{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.List
  ( Img(..)
  , mdcList_
  , mdcListDense_
  , mdcListItemStartDetail_
  , mdcListItemEndDetail_
  , mdcListAvatarList_
  , mdcListItemText_
  , mdcListItemTextPrimary_
  , mdcListItemTextSecondary_
  , mdcListTwoLine_
  , list_
  , item_
  , itemTwo_
  ) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

mdcList_ :: CssClass
mdcList_ = CssClass "mdc-list"

mdcListItem_ :: CssClass
mdcListItem_ = CssClass "mdc-list-item"

mdcListDense_ :: CssClass
mdcListDense_ = CssClass "mdc-list--dense"

mdcListItemStartDetail_ :: CssClass
mdcListItemStartDetail_ = CssClass "mdc-list-item__start-detail"

mdcListItemEndDetail_ :: CssClass
mdcListItemEndDetail_ = CssClass "mdc-list-item__end-detail"

mdcListAvatarList_ :: CssClass
mdcListAvatarList_ = CssClass "mdc-list--avatar-list"

mdcListItemText_ :: CssClass
mdcListItemText_ = CssClass "mdc-list-item__text"

mdcListItemTextPrimary_ :: CssClass
mdcListItemTextPrimary_ = CssClass "mdc-list-item__text__primary"

mdcListItemTextSecondary_ :: CssClass
mdcListItemTextSecondary_ = CssClass "mdc-list-item__text__secondary"

mdcListTwoLine_ :: CssClass
mdcListTwoLine_ = CssClass "mdc-list-item--two-line"

list_ :: MonadWidget t m => Text -> CssClass -> m a -> m a
list_ t c = elClass t (unCssClass $ mdcList_ <> c)

item_ :: MonadWidget t m => Text -> CssClass -> m a -> m a
item_ t c = elClass t (unCssClass $ mdcListItem_ <> c)

twoItem :: MonadWidget t m => m a -> m a -> m ()
twoItem a b =
  elClass "span" (unCssClass mdcListItemText_) $ do
    _ <- elClass "span" (unCssClass mdcListItemTextPrimary_) a
    _ <- elClass "span" (unCssClass mdcListItemTextSecondary_) b
    pure ()

itemTwo_ :: MonadWidget t m => Text -> CssClass -> m a -> m a -> m ()
itemTwo_ t c a b = item_ t c $ twoItem a b
