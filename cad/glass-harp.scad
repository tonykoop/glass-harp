// Glass Harp — glass array + table bounding ENVELOPE ONLY
// SPDX-License-Identifier: CC-BY-4.0
//
// Source of truth: no design table (xlsx) or measured glass inventory exists
// for this instrument yet (see ../design.md, ../bom.csv GH-GLASSES/GH-TRAY,
// ../cut-list.csv GH-CUT-001). Every dimension below is an `assumption`
// bounding-envelope placeholder for bench-planning layout, NOT a released
// glass, water-fill, or table spec.
//
// Authority: pending_measurement. NOT fabrication authority until reviewed
// against a measured glass inventory or design table (see
// ../visual-output-register.csv, ../cad/mcp-session-log.md).
//
// EXPLICITLY OUT OF SCOPE (per design.md subsystem gates — hand-refined,
// tuning-sensitive regions this envelope does not model):
//   - glass wall profile, rim geometry, and body shape (design.md has "no
//     single body to dimension" — each glass is its own resonator)
//   - water fill level / fill-height-to-pitch relationship
//   - measured pitch, dry/filled response, or scale layout
// This file models only a bounding array of generic wine-glass-scale
// envelopes on a bounding tray/table surface (spill-safe layout planning
// only, per bom.csv GH-TRAY and cut-list.csv GH-CUT-001) so a builder can
// block out table space and hand-access spacing before any of the above is
// measured.

// ---- Parameters (all `assumption`, bounding-envelope only) ----
glass_count           = 15;    // assumption: bench-planning array count (roughly one octave+), bom.csv GH-GLASSES (pending_measurement)
glass_spacing_in      = 3.5;   // assumption: hand-access spacing between glasses, design.md Tolerances As Questions (pending_measurement)
glass_max_dia_in      = 3.5;   // assumption: largest glass bounding diameter, design.md Mechanism Analysis (pending_measurement)
glass_min_dia_in      = 2.25;  // assumption: smallest glass bounding diameter, design.md Mechanism Analysis (pending_measurement)
glass_envelope_h_in   = 6;     // assumption: glass bounding height (wine-glass-scale placeholder, pending_measurement)
glass_wall_in         = 0.1;   // assumption: bounding shell thickness only, not a released wall profile
table_margin_in       = 3;     // assumption: table edge margin beyond glass array, bom.csv GH-TRAY (pending_measurement)
table_depth_in        = 10;    // assumption: table bounding depth (front-to-back), pending_measurement
table_h_in            = 1;     // assumption: table/tray bounding thickness, pending_measurement

in = 25.4; // mm per inch
table_len_in = glass_count * glass_spacing_in + table_margin_in * 2;

// ---- Modules ----

// Spill-safe tray / table bounding slab (bom.csv GH-TRAY, cut-list.csv GH-CUT-001)
module table_envelope() {
    cube([table_len_in * in, table_depth_in * in, table_h_in * in], center = false);
}

// One glass bounding envelope (generic wine-glass-scale cylinder — NOT a glass/rim spec)
module glass_envelope(dia_in) {
    difference() {
        cylinder(h = glass_envelope_h_in * in, d = dia_in * in, center = false, $fn = 32);
        translate([0, 0, glass_wall_in * in])
            cylinder(h = glass_envelope_h_in * in, d = (dia_in - 2 * glass_wall_in) * in, center = false, $fn = 32);
    }
}

// Glass array laid out across the table (bench-planning layout only; no scale/pitch order implied)
module glass_array() {
    for (i = [0 : glass_count - 1]) {
        t = i / (glass_count - 1);
        dia = glass_max_dia_in - t * (glass_max_dia_in - glass_min_dia_in);
        x = (table_margin_in + i * glass_spacing_in) * in;
        translate([x, table_depth_in * in / 2, table_h_in * in])
            glass_envelope(dia);
    }
}

// ---- Top-level assembly ----
module glass_harp_envelope() {
    color("Wheat") table_envelope();
    color("LightCyan") glass_array();
}

glass_harp_envelope();
