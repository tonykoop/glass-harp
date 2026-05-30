<!-- SPDX-License-Identifier: CC-BY-4.0 -->
---
instrument: Glass Harp
family: idiophone_friction_glass
packet_mode: v5_l1_concept
authority: concept_only
readiness: L1 concept packet
---

# Glass Harp Design Study

## Design Thesis

The glass harp is a friction idiophone made from individual wine glasses. The
player wets a finger and circles the rim, causing stick-slip excitation of the
glass. Pitch is selected by the glass and adjusted in practice by water level,
but this packet does not claim any pitch table or fill-height relationship.

The useful first step is not fabricated geometry. It is a disciplined test plan:
choose candidate glasses, label them, measure their dry and filled response,
record water levels consistently, and design a spill-safe playing surface.

## Mechanism

Each glass acts as its own resonator. The player provides a controlled wet
finger contact at the rim. Water changes the effective vibrating system and also
changes playing feel, stability, and spill risk. The setup therefore needs a
layout, labeling method, filling workflow, and measurement log before any
musical scale claim is made.

## Parametric Intent

Future data tables should separate measured values from choices:

- `glass_id`
- `glass_source_status`
- `rim_condition_status`
- `dry_response_status`
- `filled_response_status`
- `water_level_record_status`
- `onset_effort_status`
- `sustain_status`
- `spill_control_status`
- `layout_ergonomics_status`

All fields are currently `pending_measurement`. This repo does not infer pitch,
diameter, water fill, or tuning behavior from prose, images, or memory.

## Authority Boundary

- Concept authority: README, design notes, estimated BOM, and decision record.
- Measurement authority: none yet.
- CAD/DXF authority: none yet.
- Tuning authority: none yet.

Future photos or renders can document layout and playing posture, but they must
not become sources for pitch, fill height, glass dimensions, or fabrication
templates.

## Measurement Gates

Promotion beyond L1 requires:

- A real glass set labeled and measured one glass at a time.
- A repeatable water-level recording method.
- Dry and filled response logs for each candidate glass.
- A safe table or tray layout that controls spills and keeps glasses stable.
- A playability test for onset, sustain, hand spacing, and retuning drift.
- A cleaning and storage plan that preserves labels and measured fill records.

## Risks

- Small changes in water level, rim wetting, or finger pressure may shift
  response.
- Similar-looking glasses may not behave similarly.
- Spill risk can damage labels, surfaces, microphones, or electronics.
- Overconfident scale claims can hide the need for measured tuning logs.
- Glass breakage and sharp edges require a handling and disposal plan.
