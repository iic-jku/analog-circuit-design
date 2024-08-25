#!/bin/bash
# -------------------------------------------------
# Clean all auxiliary files from the render process
# -------------------------------------------------
# SPDX-FileCopyrightText: 2024 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0

rm -rf _freeze
rm -rf _manuscript
rm -rf *.html
rm -f index.fdb_latexmk
