{-# LANGUAGE OverloadedStrings #-}

module Reflex.Material.LayoutGrid
  ( GridAlign(..)
  , mdcLayoutGrid_
  , mdcLayoutGridCell_
  , mdcLayoutGridCellSpan_
  , mdcLayoutGridCellAlignTop_
  , mdcLayoutGridCellAlignMiddle_
  , mdcLayoutGridCellAlignBottom_
  , layout_
  , cell_
  , span_
  , align_
  ) where

import Data.Monoid ((<>))
import Data.Text (pack)
import Reflex.Dom

import Reflex.Material.Types

data GridAlign = AlignTop | AlignMiddle | AlignBottom

mdcLayoutGrid_ :: CssClass
mdcLayoutGrid_ = CssClass "mdc-layout-grid"

mdcLayoutGridCell_ :: CssClass
mdcLayoutGridCell_ = CssClass "mdc-layout-grid__cell"

mdcLayoutGridCellSpan_ :: Int -> CssClass
mdcLayoutGridCellSpan_ n =
  CssClass $ "mdc-layout-grid__cell--span" <> f
  where
    f | n <= 0    = ""
      | n > 12    = pack $ "-" <> show (12 :: Int)
      | otherwise = pack $ "-" <> show n

mdcLayoutGridCellAlignTop_ :: CssClass
mdcLayoutGridCellAlignTop_ = CssClass "mdc-layout-grid__cell--align-top"

mdcLayoutGridCellAlignMiddle_ :: CssClass
mdcLayoutGridCellAlignMiddle_ = CssClass "mdc-layout-grid__cell--align-middle"

mdcLayoutGridCellAlignBottom_ :: CssClass
mdcLayoutGridCellAlignBottom_ = CssClass "mdc-layout-grid__cell--align-bottom"

layout_ :: DomBuilder t m => CssClass -> m a -> m a
layout_ t = elClass "div" (unCssClass $ mdcLayoutGrid_ <> t)

cell_ :: DomBuilder t m => CssClass -> m a -> m ()
cell_ t c = elClass "div" (unCssClass (mdcLayoutGridCell_ <> t)) $ c >> pure ()

span_ :: Int -> CssClass
span_ = mdcLayoutGridCellSpan_

align_ :: GridAlign -> CssClass
align_ AlignTop    = mdcLayoutGridCellAlignTop_
align_ AlignMiddle = mdcLayoutGridCellAlignMiddle_
align_ AlignBottom = mdcLayoutGridCellAlignBottom_
