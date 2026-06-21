(* Wolfram Language 14.3 source: parametric, estimate-only glass-harp model. *)

ClearAll["Global`*"];

glassHarpMetadata = <|
   "instrument" -> "Glass Harp",
   "packet" -> "glass-harp",
   "modelName" -> "Estimate-only symbolic rim mode, water loading, and friction excitation model",
   "authority" -> "reference_only",
   "measurementStatus" -> "Every physical number is an estimate placeholder pending measurement, not fabrication authority."
   |>;

rimRadiusEstimate = Quantity[0.04, "Meters"]; (* estimate -- pending measurement, not fabrication authority *)
wallThicknessEstimate = Quantity[0.0015, "Meters"]; (* estimate -- pending measurement, not fabrication authority *)
glassDensityEstimate = Quantity[2500, "Kilograms"/"Meters"^3]; (* estimate -- pending measurement, not fabrication authority *)
glassYoungModulusEstimate = Quantity[70*^9, "Pascals"]; (* estimate -- pending measurement, not fabrication authority *)
rimModeCoefficientEstimate = 0.22; (* estimate -- pending measurement, not fabrication authority *)
effectiveGlassMassEstimate = Quantity[0.12, "Kilograms"]; (* estimate -- pending measurement, not fabrication authority *)
waterVolumeEstimate = Quantity[0.12, "Liters"]; (* estimate -- pending measurement, not fabrication authority *)
waterDensityEstimate = Quantity[1000, "Kilograms"/"Meters"^3]; (* estimate -- pending measurement, not fabrication authority *)
waterCouplingFactorEstimate = 0.35; (* estimate -- pending measurement, not fabrication authority *)
fingerNormalForceEstimate = Quantity[1.2, "Newtons"]; (* estimate -- pending measurement, not fabrication authority *)
frictionCoefficientEstimate = 0.45; (* estimate -- pending measurement, not fabrication authority *)
rimContactSpeedEstimate = Quantity[0.18, "Meters"/"Seconds"]; (* estimate -- pending measurement, not fabrication authority *)
dampingRatioEstimate = 0.015; (* estimate -- pending measurement, not fabrication authority *)
lowerFactorEstimate = 0.5; (* estimate -- pending measurement, not fabrication authority *)
upperFactorEstimate = 2.0; (* estimate -- pending measurement, not fabrication authority *)
frictionMinimumEstimate = 0.05; (* estimate -- pending measurement, not fabrication authority *)
frictionMaximumEstimate = 1.0; (* estimate -- pending measurement, not fabrication authority *)
dampingMinimumEstimate = 0.001; (* estimate -- pending measurement, not fabrication authority *)
dampingMaximumEstimate = 0.10; (* estimate -- pending measurement, not fabrication authority *)
stepFactorEstimate = 0.001; (* estimate -- pending measurement, not fabrication authority *)

rimModeFrequency[radius_, thickness_, youngModulus_, density_, modeCoefficient_] :=
  UnitConvert[
   modeCoefficient*(thickness/radius^2)*Sqrt[youngModulus/density],
   "Hertz"
   ];

waterMass[volume_, density_] := UnitConvert[volume*density, "Kilograms"];

waterLoadedFrequency[dryFrequency_, effectiveGlassMass_, waterMassValue_, couplingFactor_] :=
  UnitConvert[dryFrequency/Sqrt[1 + couplingFactor*(waterMassValue/effectiveGlassMass)], "Hertz"];

frictionDrivePower[normalForce_, frictionCoefficient_, rimSpeed_] :=
  UnitConvert[frictionCoefficient*normalForce*rimSpeed, "Watts"];

modalDampingRate[frequency_, dampingRatio_] :=
  UnitConvert[2*Pi*dampingRatio*frequency, "Hertz"];

estimateInputs = <|
   "rimRadiusEstimate" -> rimRadiusEstimate,
   "wallThicknessEstimate" -> wallThicknessEstimate,
   "glassDensityEstimate" -> glassDensityEstimate,
   "glassYoungModulusEstimate" -> glassYoungModulusEstimate,
   "rimModeCoefficientEstimate" -> rimModeCoefficientEstimate,
   "effectiveGlassMassEstimate" -> effectiveGlassMassEstimate,
   "waterVolumeEstimate" -> waterVolumeEstimate,
   "waterDensityEstimate" -> waterDensityEstimate,
   "waterCouplingFactorEstimate" -> waterCouplingFactorEstimate,
   "fingerNormalForceEstimate" -> fingerNormalForceEstimate,
   "frictionCoefficientEstimate" -> frictionCoefficientEstimate,
   "rimContactSpeedEstimate" -> rimContactSpeedEstimate,
   "dampingRatioEstimate" -> dampingRatioEstimate
   |>;

dryFrequencyEstimate = rimModeFrequency[rimRadiusEstimate, wallThicknessEstimate,
   glassYoungModulusEstimate, glassDensityEstimate, rimModeCoefficientEstimate];

glassHarpSymbolicModel = <|
   "metadata" -> glassHarpMetadata,
   "inputs" -> estimateInputs,
   "dryRimModeRelationship" -> dryFrequencyEstimate,
   "waterMassRelationship" -> waterMass[waterVolumeEstimate, waterDensityEstimate],
   "waterLoadedRelationship" -> waterLoadedFrequency[dryFrequencyEstimate, effectiveGlassMassEstimate,
     waterMass[waterVolumeEstimate, waterDensityEstimate], waterCouplingFactorEstimate],
   "frictionDrivePowerRelationship" -> frictionDrivePower[fingerNormalForceEstimate,
     frictionCoefficientEstimate, rimContactSpeedEstimate]
   |>;

glassHarpExplorer = Manipulate[
 Module[
  {
   radiusQuantity = Quantity[radius, "Meters"],
   thicknessQuantity = Quantity[thickness, "Meters"],
   youngQuantity = Quantity[youngModulus, "Pascals"],
   densityQuantity = Quantity[density, "Kilograms"/"Meters"^3],
   effectiveMassQuantity = Quantity[effectiveMass, "Kilograms"],
   waterVolumeQuantity = Quantity[waterVolume, "Liters"],
   waterDensityQuantity = Quantity[waterDensity, "Kilograms"/"Meters"^3],
   normalForceQuantity = Quantity[normalForce, "Newtons"],
   rimSpeedQuantity = Quantity[rimSpeed, "Meters"/"Seconds"],
   dryFrequency,
   addedWaterMass,
   loadedFrequency
   },
  dryFrequency = rimModeFrequency[radiusQuantity, thicknessQuantity, youngQuantity,
    densityQuantity, modeCoefficient];
  addedWaterMass = waterMass[waterVolumeQuantity, waterDensityQuantity];
  loadedFrequency = waterLoadedFrequency[dryFrequency, effectiveMassQuantity,
    addedWaterMass, waterCouplingFactor];
  Column[{
    Style["Glass-harp estimate-only rim/water/friction relationships", Bold],
    "All controls are placeholders pending measurement, not fabrication authority.",
    Grid[{
      {"dry rim-mode relationship", dryFrequency},
      {"water mass relationship", addedWaterMass},
      {"water-loaded frequency relationship", loadedFrequency},
      {"frequency ratio loaded/dry", loadedFrequency/dryFrequency},
      {"friction drive power relationship",
       frictionDrivePower[normalForceQuantity, frictionCoefficient, rimSpeedQuantity]},
      {"modal damping-rate relationship", modalDampingRate[loadedFrequency, dampingRatio]}
      }, Alignment -> Left]
    }]
  ],
 {{radius, QuantityMagnitude[rimRadiusEstimate], "rim radius estimate (m)"},
  QuantityMagnitude[lowerFactorEstimate*rimRadiusEstimate],
  QuantityMagnitude[upperFactorEstimate*rimRadiusEstimate]},
 {{thickness, QuantityMagnitude[wallThicknessEstimate], "wall thickness estimate (m)"},
  QuantityMagnitude[lowerFactorEstimate*wallThicknessEstimate],
  QuantityMagnitude[upperFactorEstimate*wallThicknessEstimate]},
 {{youngModulus, QuantityMagnitude[glassYoungModulusEstimate], "Young's modulus estimate (Pa)"},
  QuantityMagnitude[lowerFactorEstimate*glassYoungModulusEstimate],
  QuantityMagnitude[upperFactorEstimate*glassYoungModulusEstimate]},
 {{density, QuantityMagnitude[glassDensityEstimate], "glass density estimate (kg/m^3)"},
  QuantityMagnitude[lowerFactorEstimate*glassDensityEstimate],
  QuantityMagnitude[upperFactorEstimate*glassDensityEstimate]},
 {{modeCoefficient, rimModeCoefficientEstimate, "rim mode coefficient estimate"},
  lowerFactorEstimate*rimModeCoefficientEstimate, upperFactorEstimate*rimModeCoefficientEstimate},
 {{effectiveMass, QuantityMagnitude[effectiveGlassMassEstimate], "effective glass mass estimate (kg)"},
  QuantityMagnitude[lowerFactorEstimate*effectiveGlassMassEstimate],
  QuantityMagnitude[upperFactorEstimate*effectiveGlassMassEstimate]},
 {{waterVolume, QuantityMagnitude[waterVolumeEstimate], "water volume estimate (L)"},
  QuantityMagnitude[lowerFactorEstimate*waterVolumeEstimate],
  QuantityMagnitude[upperFactorEstimate*waterVolumeEstimate]},
 {{waterDensity, QuantityMagnitude[waterDensityEstimate], "water density estimate (kg/m^3)"},
  QuantityMagnitude[lowerFactorEstimate*waterDensityEstimate],
  QuantityMagnitude[upperFactorEstimate*waterDensityEstimate]},
 {{waterCouplingFactor, waterCouplingFactorEstimate, "water coupling factor estimate"},
  lowerFactorEstimate*waterCouplingFactorEstimate,
  upperFactorEstimate*waterCouplingFactorEstimate},
 {{normalForce, QuantityMagnitude[fingerNormalForceEstimate], "finger normal force estimate (N)"},
  QuantityMagnitude[lowerFactorEstimate*fingerNormalForceEstimate],
  QuantityMagnitude[upperFactorEstimate*fingerNormalForceEstimate]},
 {{frictionCoefficient, frictionCoefficientEstimate, "friction coefficient estimate"},
  frictionMinimumEstimate, frictionMaximumEstimate, stepFactorEstimate},
 {{rimSpeed, QuantityMagnitude[rimContactSpeedEstimate], "rim contact speed estimate (m/s)"},
  QuantityMagnitude[lowerFactorEstimate*rimContactSpeedEstimate],
  QuantityMagnitude[upperFactorEstimate*rimContactSpeedEstimate]},
 {{dampingRatio, dampingRatioEstimate, "damping ratio estimate"},
  dampingMinimumEstimate, dampingMaximumEstimate, stepFactorEstimate}
 ]
