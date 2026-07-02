<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Glass Harp

**Status:** L2 V5 build-packet candidate

Private V5 build-packet candidate for a glass harp: a set of tuned wine glasses played
by wet fingers around the rims, with pitch selected by glass choice and adjusted
experimentally by water level.

## Concept Boundary

This packet is a design study and L2 review scaffold only. It does not contain
fabricated dimensions, DXF coordinates, tuning values, fill-height tables,
glass specifications, or measured acoustic response. Glass selection, water
level, rim behavior, table layout, damping, and playability are all
`pending_measurement`.

## Core Mechanism

- Each glass is a friction idiophone excited at the rim by a wetted finger.
- Pitch depends on the glass body, rim, wall profile, fill level, and mounting
  context.
- Water is a tuning variable and a playing-interface requirement.
- The first build problem is repeatable selection, labeling, fill control, and
  spill-safe staging rather than CAD geometry.
- Any future pitch map must come from measured glasses, not from this concept
  packet.

## Packet Map

- `design.md` - mechanism concept, parametric intent, and measurement gates.
- `bom.csv` - estimated parts classes only.
- `cut-list.csv` - estimated blank, label, and tray/coupon families only.
- `visual-output-register.csv` - V5 authority register; all rows are
  `concept_only` or `pending_measurement`.
- `cad/mcp-session-log.md` - QMD and provenance stub; no MCP/CAD session run.
- `decision-record.md` - decisions, open questions, and promotion gates.
- `sourcing.csv`, `validation.csv`, `risks.md`, `drawing-brief.md` - V5
  baseline packet tables (TBD-marked; no design table exists yet).
- `cad/glass-harp.scad` - non-dimensional glass array + table bounding
  envelope; authority `pending_measurement`.
- `evolution/` - evolution-pipeline Stage 0 intake: master manifest,
  design-intent, and revision register (Gate A not yet run).

## Readiness

L2 means the repo is organized for glass-set selection, measurement, layout,
and repeatability review. It still does not authorize fabrication, tuning, or
performance claims. Promotion beyond L2 requires a real glass set, measured dry
and filled responses, a fill-recording protocol, and a safe playing layout.
