Profile: CZ_Bundle_Lab
Parent: $Bundle-eu-lab
Id: cz-bundle-lab
Title: "Bundle - Laboratory Result Report"
Description: "This profile represents the constraints applied to the Bundle resource by the Czech national laboratory report (HDR) FHIR Implementation Guide."
* ^purpose = "Laboratory result report bundle is an electronic health record extract containing results of laboratory testing of specimens from a subject of care, comprising at least the required elements of the lab dataset."
//* obeys bdl-ips-1
* . ^short = "Laboratory Result Report Bundle"
* . ^definition = "Laboratory Result Report Bundle. \r\nA container for a collection of resources in the laboratory result document."

* entry
  * ^short = "Entry resource in the laboratory result report bundle"
  * ^definition = "An entry resource included in the laboratory result report document bundle resource."
  * ^comment = "Must contain the Lab Composition as the first entry (only a single Composition resource instance may be included).  Additional constraints are specified in the Lab Composition profile."

* entry[composition].resource only CZ_CompositionLabReport
* entry[diagnosticReport].resource only CZ_DiagnosticReportLab
* entry[patient].resource only CZ_PatientLab or CZ_PatientLabAnimalLab
* entry[observation].resource only CZ_ObservationResultLaboratory
* entry[specimen].resource only CZ_SpecimenLab
* entry[serviceRequest].resource only CZ_ServiceRequestLab
* entry[organization].resource only CZ_Organization
* entry[practitioner].resource only CZ_Practitioner
* entry[practitionerRole].resource only CZ_PractitionerRoleLab
//* entry[bodyStructure].resource only BodyStructureEuLab
//* entry[encounter].resource only Encounter
//* entry[location].resource only Location
//* entry[provenance].resource only Provenance

//* entry contains coverage 0..*
//* entry[coverage].resource only Coverage

//* entry contains device 0..*
* entry[device].resource only CZ_DeviceObserver

//* entry contains procedure 0..
* entry[procedure].resource only ProcedureUvIps // CZ

* entry contains condition 0..*
* entry[condition].resource 1..
* entry[condition].resource only ConditionUvIps // CZ

/* * entry contains media 0..*
//* entry[media].resource 1..
* entry[media].resource only MediaObservationUvIps  // CZ
 */

/*
* entry contains medication 0..*
* entry[medication].resource only CZ_Medication  // CZ

* entry contains medicationstatement 0..*
* entry[medicationstatement].resource only CZ_MedicationStatement
*/
