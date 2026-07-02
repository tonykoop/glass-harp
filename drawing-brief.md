<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Glass Harp Drawing Brief

No dimensioned drawings exist yet. This brief names the first drawings a
builder would need once a real glass set is inventoried and measured (see
design.md Measurement Gates).

Required first drawings (blocked on measurement):

- Glass array + table layout: candidate glass count and spacing on the
  spill-safe tray once a real glass inventory exists (design.md Mechanism
  Analysis; bom.csv GH-TRAY, GH-GLASSES).
- Tray/pad detail: damping and slip-resistance test layout (cut-list.csv
  GH-CUT-001..GH-CUT-003).
- Label and fill-marker placement diagram (non-tuning-authority) for glass ID
  and water-level workflow (cut-list.csv GH-CUT-004, GH-CUT-005).

## Authority Notes

- No design table (xlsx) or measured glass inventory exists for this
  instrument. Every dimension referenced above is `pending_measurement`
  until a real glass set is measured (design.md Authority Boundary).
- Do not produce a fabrication drawing before the glass inventory, water-level
  repeatability, and layout-safety tests in `validation.csv` are complete.
- `cad/glass-harp.scad` (if present) is a non-dimensional glass array + table
  bounding envelope only — it does not model glass wall profile, rim
  geometry, water fill, or pitch mapping, and is not drawing authority.
