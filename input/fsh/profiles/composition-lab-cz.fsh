Profile: CZ_CompositionLabReport
Parent: $clinicaldocument
Id: cz-composition-lab-report
Title: "Composition: Laboratory Report"
Description: "Clinical document used to represent a Laboratory Report in the scope of the Czech national interoperability project."
* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://ncez.mczr.cz"
* . ^short = "Laboratory Report composition"
* . ^definition = "Laboratory Report composition.\r\nA composition is a set of healthcare-related information that is assembled together into a single logical document that provides a single coherent statement of meaning, establishes its own context and that has clinical attestation with regard to who is making the statement. \r\nWhile a Composition defines the structure, it does not actually contain the content: rather the full content of a document is contained in a Bundle, of which the Composition is the first resource contained."

* insert SetFmmandStatusRule ( 0, draft )


// what to do with the composition text ?
// should we make it 0.. ?
// or have text repeated here and in the sections ?

// TODO
//* extension contains CompositionBasedOnOrderOrRequisition named basedOn-order-or-requisition 0..*
//* extension[based-on-order-or-requisition].valueReference only Reference(CZ_ServiceRequestLab)

* extension contains $information-recipient named information-recipient 0..*
* extension[information-recipient].valueReference only Reference(CZ_PractitionerCore or CZ_DeviceObserver or CZ_PatientCore or RelatedPerson or CZ_PractitionerRoleCore or CZ_OrganizationCore)

* extension contains DiagnosticReportReference named diagnosticReport-reference 0..1
* extension[diagnosticReport-reference].valueReference only Reference(CZ_DiagnosticReportLab)
* extension[diagnosticReport-reference].valueReference 1..1
* extension[diagnosticReport-reference].valueReference.reference 1..

  * ^comment = """Added to the FHIR R4 guide to strictly conform with the R4 rules for document bundle resources inclusion.
  Using this extension implies to accept a circular reference Composition to/from  DiagnosticReport"""

/*  TO DO Header
- add optional data enterer
- defiend rules for attester to distiguish Authenticators and Legal Auth
- ordering provider mapped into the order details
- add Lab DocumentationOf.serviceEvent details
- ComponentOf.encounter define details in Encounter profile
*/

// (LN) * category only CZ_CodeableConcept
//  * ^short = "Report Category"
//  * ^definition = "Specifies the Report Category: usually Laboratory"
//  * ^comment = "DiagnosticReport.category and Composition.category shall be aligned"
// (LN)   * ^constraint.key = "labRpt-category"
// (LN)   * ^constraint.severity = #warning
// (LN)   * ^constraint.human = "DiagnosticReport.category and Composition.category shall be aligned"

//* category ^slicing.discriminator.type = #pattern
//* category ^slicing.discriminator.path = "$this"
//* category ^slicing.rules = #open
//* category ^definition = "A code that classifies this laboratory report. Two basic categories has been selected in this guide: laboratory specialty and Study type. Laboratory specialty is characteristic of the laboratory that produced the test result while Study type is an arbitrary classificion of the test type."
// (LN) * category contains studyType 0..*
// (LN) * category[studyType] only CZ_CodeableConcept
//* category[studyType] from LabStudyTypesEuVs
//* category[studyType]
//  * ^short = "The way of grouping of the test results into clinically meaningful domains (e.g. hematology study, microbiology study, etc.)"
//  * ^definition = "Laboratory services, i.e., results of tests performed, could be characterized using typology of services, commonly called study types. Study type could be seen as an attribute or grouping mechanism that assigns a common clinical sense to certain types of laboratory test results., e.g., Hemoglobin, Platelet count, etc. belongs to 'Hematology study'."
//  * ^comment = "In comparison to the laboratory specialty which is an attribute of laboratory, study type is a categorization of laboratory service. It needs to be mentioned that classification of test to study types in not standardized."

// "The way of grouping of the test results into clinically meaningful domains (e.g. hematology study, microbiology study, etc.)"

//* category contains specialty 0..*
// (LN) * category[specialty] only CZ_CodeableConcept
//* category[specialty] from LabSpecialtyEuVs
//* category[specialty]
//  * ^short = "The clinical domain of the laboratory performing the observation (e.g. microbiology, toxicology, chemistry)"
//  * ^definition = "Laboratory specialty is an attribute of any laboratory setting representing professional qualification of the laboratory to execute certain kind of laboratory tests."
//  * ^comment = "Specialty could be used as parameter for searching/querying of laboratory test results."

//* type = $loinc#11502-2 // change to a VS binding
// (LN) * type only CZ_CodeableConcept
//  * ^short = "Kind of composition (\"Laboratory Report\")"
//  * ^definition = "Specifies that this composition refer to a Laboratory Report"
//  * ^comment = "At least one DiagnosticReport.code.coding and Composition.type.coding SHALL be equal"

// ToDo: Review binding and value set
//* type from CZ_LaboratoryTypesVS

* subject only Reference(CZ_PatientCore or Group or Location or Device or CZ_MedicalDevice)
//* subject 1..1

* attester
  * party only Reference(CZ_PatientCore or RelatedPerson or CZ_PractitionerCore or CZ_PractitionerRoleCore or CZ_OrganizationCore)

/*
* attester 0.. // RH - should attester be 1.. or 0..? - since author is also required?
  * ^short = "Attests the report accuracy"
  * mode ^short = "The type of attestation"
  * time ^short = "When the report was attested by the party"
  * party
    * ^short = "Who attested the report"
    * ^comment = "For a Laboratory Report it is usually non expected that the attester would be a Patient or a RealtedPerson"
*/
* custodian only Reference(CZ_OrganizationCore)

* title
  * ^short = "Laboratorní nález"
  * ^definition = "Official human-readable label for the composition.\r\n\r\nFor this document should be \"Laboratorní nález\" or \"Laboratorní souhrn\""

// ServiceRequest and/or RequestGroup


//* section.title 1..
//* section.code 1..
//  (LN) * section.code only CZ_CodeableConcept

// -------------------------------------
// Single section  0 .. 1
// -------------------------------------

//* section contains lab-no-subsections ..* // check if ..1 or ..*
// (LN) * section[lab-no-subsections]
  //* ^short = "Variant 1: Laboratory Report section with text and entry"
  //* ^definition = """Variant 1: With this option, the Section text SHALL be present and not blank. This narrative block SHALL present to the human reader, all the observations produced for this Specialty, using the various structures available for the FHIR  Narrative. The narrative block should be fully derived from the entry containing the machine-readable result data. Additionally, Laboratory Report Data Entries SHALL be present. This entry contains the machine-readable result data from which the narrative block of this section should be derived."""
// (LN)   * code from CZ_LabStudyTypesVS (preferred)
  //* text ^short = "Text summary of the section, for human interpretation."
// (LN)   * entry only Reference (CZ_ObservationResultLaboratory)

// -------------------------------------
// Structured sections  0 .. 1
// -------------------------------------
//* section contains lab-subsections ..* // check if ..1 or ..*
// (LN) * section[lab-subsections]
  //* ^short = "Variant 2: EU Laboratory Report section with one to many subsections Laboratory Report Item"
  //* ^definition = """Varient 2: With this option, this Laboratory Specialty Section SHALL contain NEITHER a top level text NOR entry elements. Each Report Item is contained in a corresponding Laboratory Report Item Section which contains the Lab Report Data Entry."""
// (LN)  * code only CZ_CodeableConcept
// (LN)   * code from CZ_LabStudyTypesVS (preferred)
  //* text 0..0
  //* entry 0..0
// (LN)   * section 1..
    //* code 1..
    // (LN) * code only CZ_CodeableConcept
 // (LN)    * code from CZ_LabStudyTypesVS (preferred)
    //* text ^short = "Text summary of the section, for human interpretation."
    //* entry 1..
 // (LN)    * entry only Reference (CZ_ObservationResultLaboratory)
    //* section 0..0

// -------------------------------------
// Annotation section  0 .. 1
// -------------------------------------
/*
* section contains annotations ..* // check if ..1 or ..*
* section[annotations]
  * ^short = "Annotation comment"
  * ^definition = """Narrative expression of comments accompanying the report, such as suggestions for evaluation, technical notes from the laboratory, etc.

Examples:
Suggestion: This result should be evaluated in relation to the patient's medical history and clinical condition.
Technical note: A list of accredited examination(s) is available at www.laboratory.com. """

  * code = http://loinc.org#48767-8 (exactly) // add binding
  * text 1..
  * section ..0
*/