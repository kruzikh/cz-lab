Profile: CZ_PatientLab
Parent: CZ_PatientCore 
Id: cz-patient-lab 
Title:    "Patient (CZ)"
Description: "This profile defines how to represent Patient in FHIR for the purpose of the Czech national interoperability standards."

// this statement says that this profile conforms with the eu lab one
* insert ImposeProfile($Patient-eu-core)

* insert SetFmmandStatusRule ( 0, draft )