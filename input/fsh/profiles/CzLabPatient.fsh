Profile: CZ_PatientLab
Parent: CZ_PatientCore // or your local Patient profile
Id: cz-patient-lab // or -lab-myorg-jur
Title:    "Pacient/Patient (CZ)"
Description: "Tento profil definuje způsob reprezentace pacienta ve FHIR pro účely českých národních standardů interoperability. / This profile defines how to represent Patient in FHIR for the purpose of the Czech national interoperability standards."

// this statement says that this profile conforms with the eu lab one
* insert ImposeProfile($Patient-eu-core)