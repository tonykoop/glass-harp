# Design Intent — glass-harp rev A

- Master CAD: `cad/glass-harp.scad` (sha256: 8ccf0782fad3cd6876c2b5fc61df6045fb9b367a628cb298690f3b91f3dbf149) — a non-dimensional glass array + table bounding envelope. No design table (xlsx) or measured glass inventory exists for this instrument; `design.md`, `bom.csv`, and `cut-list.csv` are the governing sources.
- Function: Friction idiophone made of individual wine glasses. The player wets a finger and circles the rim, causing stick-slip excitation; pitch is selected by glass choice and adjusted experimentally by water level (design.md Design Thesis). No pitch table or fill-height relationship is claimed.
- Environment: tabletop/tray setup; water is both a tuning variable and a spill risk (risks.md).
- Target qty: 1 (prototype bench layout). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Glass array count / spacing | 15 glasses @ 3.5 in (assumption) | none — bench-planning only | hand-access spacing | cad/glass-harp.scad header (assumption, not a design-table value) |
| Glass wall profile / rim geometry | TBD (no single body to dimension — design.md) | measurement_required | pitch, onset/sustain | design.md Mechanism Analysis |
| Water fill level | TBD | measurement_required | pitch/response variable | design.md Parametric Intent `water_level_record_status` |
| Tray/table layout + damping | TBD | measurement_required | stability, spill safety | bom.csv GH-TRAY, cut-list.csv GH-CUT-001 |

## Incidental (free for DFM)

- Table finish/color; exact glass-count/spacing placeholders shown in cad/glass-harp.scad (bench-planning only, not released tuning geometry).

## Must-nots (DFM may never violate)

- Never invent glass, water-fill, or tray dimensions — every value in bom.csv/cut-list.csv stays `pending_measurement` until a measured glass inventory sets it (design.md Authority Boundary).
- Do not treat the OpenSCAD envelope as a glass wall-profile, rim, or pitch model — explicitly out of scope (cad/glass-harp.scad header).
- Do not group glasses into a scale before the set has been measured one glass at a time (design.md Mechanism Analysis).
- Do not finalize a tray/pad material before damping/slip listening tests clear (design.md Failure Modes).

## Material intent

- Preferred: per bom.csv subsystem categories (wine glass set, spare glasses, water-measuring tool, spill-safe tray, non-damping pads) — all quantities/specs `pending_measurement`/`estimate_pending`.
- Acceptable subs: none recorded (sourcing.csv is TBD pending glass-inventory specs).
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
