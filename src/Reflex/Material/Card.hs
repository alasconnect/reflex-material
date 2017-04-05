{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Card
  ( mdcCard_
  , mdcCardPrimary_
  , mdcCardTitle_
  , mdcCardTitleLarge_
  , mdcCardSubTitle_
  , mdcCardSupportingText_
  , mdcCardActions_
  , mdcCardAction_
  , mdcCardActionsVertical_
  , mdcCardMediaItem_
  , mdcCardMediaItem1dot5x_
  , mdcCardMediaItem2x_
  , mdcCardMediaItem3x_
  , card_
  , cardPrimary_
  , cardTitle_
  , cardSubTitle_
  , cardSupportingText_
  , cardActions_
  , cardAction_
  , cardAction'_
  ) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Button
import Reflex.Material.Types

mdcCard_ :: CssClass
mdcCard_ = CssClass "mdc-card"

mdcCardPrimary_ :: CssClass
mdcCardPrimary_ = CssClass "mdc-card__primary"

mdcCardTitle_ :: CssClass
mdcCardTitle_ = CssClass "mdc-card__title"

mdcCardTitleLarge_ :: CssClass
mdcCardTitleLarge_ = CssClass $ unCssClass mdcCardTitle_ <> "--large"

mdcCardSubTitle_ :: CssClass
mdcCardSubTitle_ = CssClass "mdc-card__subtitle"

mdcCardSupportingText_ :: CssClass
mdcCardSupportingText_ = CssClass "mdc-card__supporting-text"

mdcCardActions_ :: CssClass
mdcCardActions_ = CssClass "mdc-card__actions"

mdcCardActionsVertical_ :: CssClass
mdcCardActionsVertical_ = CssClass $ unCssClass mdcCardActions_ <> "--vertical"

mdcCardAction_ :: CssClass
mdcCardAction_ = CssClass "mdc-card__action"

mdcCardMediaItem_ :: CssClass
mdcCardMediaItem_ = CssClass "mdc-card__media-item"

mdcCardMediaItem :: Text -> CssClass
mdcCardMediaItem t = CssClass $ unCssClass mdcCardMediaItem_ <> t

mdcCardMediaItem1dot5x_ :: CssClass
mdcCardMediaItem1dot5x_ = mdcCardMediaItem "--1dot5x"

mdcCardMediaItem2x_ :: CssClass
mdcCardMediaItem2x_ = mdcCardMediaItem "--2x"

mdcCardMediaItem3x_ :: CssClass
mdcCardMediaItem3x_ = mdcCardMediaItem "--3x"

card_ :: MonadWidget t m => Text -> CssClass -> m a -> m a
card_ t c = elClass t (unCssClass $ mdcCard_ <> c)

cardPrimary_ :: MonadWidget t m => Text -> CssClass -> m a -> m a
cardPrimary_ t c = elClass t (unCssClass $ mdcCardPrimary_ <> c)

cardTitle_ :: MonadWidget t m => Text -> CssClass -> Text -> m ()
cardTitle_ t c v = elClass t (unCssClass $ mdcCardTitle_ <> c) $ text v

cardSubTitle_ :: MonadWidget t m => Text -> CssClass -> Text -> m ()
cardSubTitle_ t c v = elClass t (unCssClass $ mdcCardSubTitle_ <> c) $ text v

cardSupportingText_ :: MonadWidget t m => Text -> CssClass -> Text -> m ()
cardSupportingText_ t c v =
  elClass t (unCssClass $ mdcCardSupportingText_ <> c) $ text v

cardActions_ :: MonadWidget t m => Text -> CssClass -> m a -> m a
cardActions_ t c = elClass t (unCssClass $ mdcCardActions_ <> c)

cardAction_ :: MonadWidget t m => CssClass -> Text -> m ()
cardAction_ t v = cardAction'_ t v >> pure ()

cardAction'_ :: MonadWidget t m => CssClass -> Text -> m (El t, ())
cardAction'_ t = button'_ (mdcCardAction_ <> t)
