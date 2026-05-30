<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Glass Harp

Status: L1 concept packet

Private V5 concept packet for a glass harp: a set of tuned wine glasses played
by wet fingers around the rims, with pitch selected by glass choice and adjusted
experimentally by water level.

## Concept Boundary

This packet is a design study only. It does not contain fabricated dimensions,
DXF coordinates, tuning values, fill-height tables, glass specifications, or
measured acoustic response. Glass selection, water level, rim behavior, table
layout, damping, and playability are all `pending_measurement`.

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
- `visual-output-register.csv` - V5 authority register; all rows are
  `concept_only` or `pending_measurement`.
- `cad/mcp-session-log.md` - QMD and provenance stub; no MCP/CAD session run.
- `decision-record.md` - decisions, open questions, and promotion gates.

## Readiness

L1 means the repo captures intent and unknowns. Promotion to L2 requires a real
glass set, measured dry and filled responses, a fill-recording protocol, and a
safe playing layout.
