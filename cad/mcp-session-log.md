<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# MCP Session Log

V5 provenance stub for the glass harp L1 packet.

## Step 0 QMD

| Date | Command | Result | Notes |
| --- | --- | --- | --- |
| 2026-05-30 | `timeout 30 qmd query "glass harp tuned wine glasses played by wet fingers on the rims; pitch adjusted by water level and glass size; friction excitation of glass rim"` | unavailable | Command began search planning but exited with timeout code 124 before returning usable context. No QMD output was used as fabrication, CAD, dimension, fill-height, or tuning authority. |

## External Tool Sessions

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| none-2026-05-30 | none | User prompt and general mechanism description. | `README.md`, `design.md`, `bom.csv`, `decision-record.md`, `visual-output-register.csv`, `cad/mcp-session-log.md` | l1_concept_packet | concept_only | self_checked | No MCP, CAD, image, audio, Wolfram, or CAM tool generated artifacts. |
| 2026-05-30-r7-l2-uplift | Codex local edit | Existing L1 packet and Round 7 convention. | `README.md`, `design.md`, `bom.csv`, `cut-list.csv`, `decision-record.md`, `visual-output-register.csv`, `cad/mcp-session-log.md` | l2_packet_uplift | pending_measurement | self_checked | Deepened L2 review scaffold only. No CAD, DXF, glass dimensions, water volumes, tuning values, acoustic numbers, fill-height tables, or fabrication coordinates were generated. |
| 2026-05-30-r8-glass-harp-wolfram | Codex CLI; local file editing | `docs/plans/2026-05-30-round8/_WOLFRAM_AUTHOR.md`; existing packet files | `glass-harp-starter.wl`, `wolfram/glass-harp-wolfram-model.wl`, `visual-output-register.csv`, `cad/mcp-session-log.md` | wolfram_source_authoring | reference_only | self_checked | No MCP or Wolfram Desktop session was run. Source was authored by hand as a parametric estimate-only model; physical numbers are placeholders pending measurement, not fabrication authority. |

| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | design.md, bom.csv, cut-list.csv (no design table/xlsx exists for this instrument) | bom.csv, cut-list.csv, sourcing.csv, validation.csv | packet_refresh | fabrication | self_checked | V5 refresh pass: added sourcing.csv and validation.csv baseline files; reviewed existing bom.csv/cut-list.csv against design.md — no dimension changes made, all rows remain pending_measurement. Provenance rows added to satisfy V5 fabrication-artifact logging. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | design.md subsystem gates, bom.csv GH-GLASSES/GH-TRAY, cut-list.csv GH-CUT-001 (no design table/xlsx; all values marked `assumption`) | cad/glass-harp.scad | cad_authoring | pending_measurement | self_checked | Non-dimensional glass array + table bounding envelope authored as bench-planning layout only; glass wall/rim profile, water fill level, and pitch mapping explicitly out of scope per design.md subsystem gates. OpenSCAD render check: pass (openscad -o STL, exit 0). |

## Authority Notes

- No fabricated dimensions, DXF coordinates, glass specifications, water levels,
  tuning values, pitch maps, or measured acoustic response were created.
- Future pitch and layout claims must trace to measured glasses, water-level
  records, and validation logs before promotion beyond L2.
- 2026-07-01: `cad/glass-harp.scad` was added as a non-dimensional glass
  array + table bounding envelope (bench-planning layout only); it does not
  create glass wall/rim profile, water-fill, or pitch-mapping authority.
