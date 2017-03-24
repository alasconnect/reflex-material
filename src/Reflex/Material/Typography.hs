{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.Typography
  ( mdcTypography_
  , mdcTypographyDisplay4_
  , mdcTypographyDisplay3_
  , mdcTypographyDisplay2_
  , mdcTypographyDisplay1_
  , mdcTypographyTitle_
  , mdcTypographyCaption_
  , mdcTypographySubheading2_
  , mdcTypographySubheading1_
  , mdcTypographyBody1_
  , mdcTypographyBody2_
  , display4_
  , display2_
  , display3_
  , display1_
  , headline_
  , title_
  , caption_
  , titleCaption_
  , subheading2_
  , subheading1_
  , body1_
  , body2_
  ) where

import Data.Text (Text)
import Reflex.Dom

import Reflex.Material.Types

mdcTypography_ :: CssClass
mdcTypography_ = CssClass "mdc-typography"

mdcTypographyDisplay4_ :: CssClass
mdcTypographyDisplay4_ = CssClass "mdc-typography--display4"

mdcTypographyDisplay3_ :: CssClass
mdcTypographyDisplay3_ = CssClass "mdc-typography--display3"

mdcTypographyDisplay2_ :: CssClass
mdcTypographyDisplay2_ = CssClass "mdc-typography--display2"

mdcTypographyDisplay1_ :: CssClass
mdcTypographyDisplay1_ = CssClass "mdc-typography--display1"

mdcTypographyHeadline_ :: CssClass
mdcTypographyHeadline_ = CssClass "mdc-typography--headline"

mdcTypographyTitle_ :: CssClass
mdcTypographyTitle_ = CssClass "mdc-typography--title"

mdcTypographyCaption_ :: CssClass
mdcTypographyCaption_ = CssClass "mdc-typography--caption"

mdcTypographySubheading1_ :: CssClass
mdcTypographySubheading1_ = CssClass "mdc-typography--subheading1"

mdcTypographySubheading2_ :: CssClass
mdcTypographySubheading2_ = CssClass "mdc-typography--subheading2"

mdcTypographyBody1_ :: CssClass
mdcTypographyBody1_ = CssClass "mdc-typography--body1"

mdcTypographyBody2_ :: CssClass
mdcTypographyBody2_ = CssClass "mdc-typography--body2"

display4_ :: MonadWidget t m => Text -> m ()
display4_ = elClass "h1" (unCssClass mdcTypographyDisplay4_) . text

display3_ :: MonadWidget t m => Text -> m ()
display3_ = elClass "h1" (unCssClass mdcTypographyDisplay3_) . text

display2_ :: MonadWidget t m => Text -> m ()
display2_ = elClass "h1" (unCssClass mdcTypographyDisplay2_) . text

display1_ :: MonadWidget t m => Text -> m ()
display1_ = elClass "h1" (unCssClass mdcTypographyDisplay1_) . text

headline_ :: MonadWidget t m => Text -> m ()
headline_ = elClass "h1" (unCssClass mdcTypographyHeadline_) . text

title_ :: MonadWidget t m => Text -> m ()
title_ = elClass "h2" (unCssClass mdcTypographyTitle_) . text

caption_ :: MonadWidget t m => Text -> m ()
caption_ = elClass "span" (unCssClass mdcTypographyCaption_) . text

titleCaption_ :: MonadWidget t m => Text -> Text -> m ()
titleCaption_ t c = title_ t >> text t >> caption_ c

subheading2_ :: MonadWidget t m => Text -> m ()
subheading2_ = elClass "h3" (unCssClass mdcTypographySubheading2_) . text

subheading1_ :: MonadWidget t m => Text -> m ()
subheading1_ = elClass "h4" (unCssClass mdcTypographySubheading1_) . text

body1_ :: MonadWidget t m => Text -> m ()
body1_ = elClass "p" (unCssClass mdcTypographyBody1_) . text

body2_ :: MonadWidget t m => Text -> m ()
body2_ = elClass "p" (unCssClass mdcTypographyBody2_) . text
