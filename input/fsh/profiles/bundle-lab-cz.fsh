Profile: CZ_BundleLab
Parent: Bundle
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


* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
// * entry ^slicing.ordered = true => changed on 2023-07-19  to be checked
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open

* entry contains composition 1..1
* entry[composition].resource only CZ_CompositionLabReport

* entry contains diagnosticReport 1..1
* entry[diagnosticReport].resource only CZ_DiagnosticReportLab

* entry contains patient 0..1
* entry[patient].resource only CZ_PatientCore or CZ_PatientAnimal

* entry contains observation 0..*
* entry[observation].resource only CZ_ObservationResultLaboratory

* entry contains specimen 0..*
* entry[specimen].resource only CZ_SpecimenLab

* entry contains serviceRequest 0..*
* entry[serviceRequest].resource only CZ_ServiceRequestLab

* entry contains organization 0..*
* entry[organization].resource only CZ_OrganizationCore

* entry contains practitioner 0..*
* entry[practitioner].resource only CZ_PractitionerCore

* entry contains practitionerRole 0..*
* entry[practitionerRole].resource only CZ_PractitionerRoleCore
//* entry[bodyStructure].resource only BodyStructureEuLab
//* entry[encounter].resource only Encounter
//* entry[location].resource only Location
//* entry[provenance].resource only Provenance

//* entry contains coverage 0..*
//* entry[coverage].resource only Coverage

* entry contains device 0..*
* entry[device].resource only CZ_DeviceObserver

//* entry contains procedure 0..
// (LN)  * entry[procedure].resource only ProcedureUvIps // CZ 

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
