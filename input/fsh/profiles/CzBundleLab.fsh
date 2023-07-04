Profile: CZ_Bundle_Lab
Parent: Bundle
Id: cz-bundle-lab
Title: "Bundle - Laboratory Result Report"
Description: "This profile represents the constraints applied to the Bundle resource by the Czech national laboratory report (HDR) FHIR Implementation Guide."
* ^purpose = "Laboratory result report bundle is an electronic health record extract containing results of laboratory testing of specimens from a subject of care, comprising at least the required elements of the lab dataset."
//* obeys bdl-ips-1
* . ^short = "Laboratory Result Report Bundle"
* . ^definition = "Laboratory Result Report Bundle. \r\nA container for a collection of resources in the laboratory result document."

* identifier 1.. MS
* type = #document (exactly)
* timestamp 1.. MS
* link ..0
* entry 1.. MS
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open
* entry ^short = "Entry resource in the laboratory result report bundle"
* entry ^definition = "An entry resource included in the laboratory result report document bundle resource."
* entry ^comment = "Must contain the Lab Composition as the first entry (only a single Composition resource instance may be included).  Additional constraints are specified in the Lab Composition profile."
* entry.fullUrl 1.. MS
* entry.search ..0
* entry.request ..0
* entry.response ..0

* entry contains composition 1..1
//* entry[composition].resource 1..
* entry[composition].resource only CZ_CompositionLabReport

* entry contains diagnosticReport 1..1
* entry[diagnosticReport].resource only CZ_DiagnosticReportLab

* entry contains patient 1..1
//* entry[patient].resource 1..
* entry[patient].resource only CZ_Patient

* entry contains condition 0..*
//* entry[condition].resource 1..
* entry[condition].resource only ConditionUvIps // CZ

* entry contains device 0..*
* entry[device].resource only CZ_DeviceObserver

* entry contains observation 0..*
* entry[observation].resource only CZ_ObservationLaboratory // Add profiles


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

* entry contains practitioner 0..
* entry[practitioner].resource only CZ_Practitioner

* entry contains practitionerRole 0..
* entry[practitionerRole].resource only CZ_PractitionerRole

* entry contains procedure 0..
* entry[procedure].resource only ProcedureUvIps // CZ

* entry contains organization 0..
* entry[organization].resource only CZ_Organization

* entry contains specimen 0..
* entry[specimen].resource only CZ_SpecimenLab

* entry contains serviceRequest 0..*
* entry[serviceRequest].resource only CZ_ServiceRequestLab

