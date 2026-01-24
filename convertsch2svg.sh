#!/bin/sh
# ----------------------------------------
# Batch Xschem schematic to SVG converter)
# ----------------------------------------
# SPDX-FileCopyrightText: 2024-2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0

find xschem -type f -name "*.sch" -exec sak-sch2svg.sh {} \;
