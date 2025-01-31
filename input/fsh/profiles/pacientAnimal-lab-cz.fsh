Profile: CZ_PatientAnimalLab
Parent: CZ_PatientAnimal
Id: cz-patient-animal-lab
Title:    "Patient Animal (CZ)"
Description: "This profile defines how to represent Patient Animal in FHIR for the purpose of the Czech national interoperability standards."

// this statement says that this profile conforms with the eu lab one
* insert ImposeProfile($Patient-animal-eu-lab)

* insert SetFmmandStatusRule ( 0, draft )
