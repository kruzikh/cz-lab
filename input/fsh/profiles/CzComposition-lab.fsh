Profile: CZ_CompositionLabReport
Parent: http://hl7.org/fhir/StructureDefinition/clinicaldocument
Id: cz-composition-lab-report
Title: "Composition: Laboratory Report"
Description: "Clinical document used to represent a Laboratory Report in the scope of the Czech national interoperability project."
* insert SetFmmandStatusRule ( 0, draft )
* ^publisher = "NCEZ"
* ^copyright = "NCEZ"
* . ^short = "Laboratory Report composition"
* . ^definition = "Laboratory Report composition.
\r\nA composition is a set of healthcare-related information that is assembled together into a single logical document that provides a single coherent statement of meaning, establishes its own context and that has clinical attestation with regard to who is making the statement. \r\nWhile a Composition defines the structure, it does not actually contain the content: rather the full content of a document is contained in a Bundle, of which the Composition is the first resource contained."
// what to do with the composition text ?
// should we make it 0.. ?
// or have text repeated here and in the sections ?

* extension contains CompositionBasedOnOrderOrRequisition named based-on-order-or-requisition 0..*
* extension[based-on-order-or-requisition].valueReference only Reference(CZ_ServiceRequestLab)

* extension contains InformationRecipient named information-recipient 0..*
* extension[information-recipient]

/*  TO DO Header
- add optional data enterer
- defiend rules for attester to distiguish Authenticators and Legal Auth
- ordering provider mapped into the order details
- add Lab DocumentationOf.serviceEvent details
- ComponentOf.encounter define details in Encounter profile
*/

* text ^short = "Narrative text"
//* insert ReportIdentifierRule
//* insert ReportStatusRule
// * category 1.. // add VS binding
//* insert ReportCategoryRule
// * type = $loinc#11502-2 // change to a VS binding
//* insert ReportTypeRule ( type )
  // slice the subject tp cover the three cases of human ; non-human and mixed
//* insert ReportSubjectRule
//* insert ReportEncounterRule

* identifier ^short = "Business identifier of the Laboratory Report (setID)"
* status ^short = "Status of the Report"

* type = $loinc#11502-2 // change to a VS binding
* type only CZ_CodeableConcept
  * ^short = "Kind of composition (\"Laboratory Report\")"
  * ^definition = "Specifies that this composition refer to a Laboratory Report"
  // slice the subject to cover the three cases of human ; non-human and mixed

* subject only Reference(CZ_Patient or Patient or Group or Location or Device or CZ_MedicalDevice)
* subject 1..1

* encounter only Reference (Encounter)  // profile defined for other scopes to be checked

* author 1..
* author ^short = "Who and/or what authored the Laboratory Report"
* author ^definition = "Identifies who is responsible for the information in the Laboratory Report, not necessarily who typed it in."

* attester 1.. // RH - should attester be 1.. or 0..? - since author is also required?
  * ^short = "Attests the report accuracy"
  * mode ^short = "The type of attestation"
  * time ^short = "When the report was attested by the party"
  * party
    * ^short = "Who attested the report"
    * ^comment = "For a Laboratory Report it is usually non expected that the attester would be a Patient or a RealtedPerson"

* custodian only Reference (CZ_Organization)

* event
  * ^short = "The laboratory service(s) being documented"
  * code ^short =	"Code(s) that apply to the laboratory service(s) being documented"
  * period ^short = "Period of time covered by the documentation"
  * detail ^short = "The laboratory service(s) being documented"

* title 1..
* title ^short = "Laboratorní nález"
* title ^definition = "Official human-readable label for the composition.\r\n\r\nFor this document should be \"Laboratorní nález\" or \"Laboratorní souhrn\""

// ServiceRequest and/or RequestGroup

* section 1..
  * ^slicing.discriminator[0].type = #exists
  * ^slicing.discriminator[0].path = "$this.section"
  * ^slicing.discriminator[+].type = #type
  * ^slicing.discriminator[=].path = "$this.entry.resolve()"
  * ^slicing.discriminator[+].type = #pattern
  * ^slicing.discriminator[=].path = "$this.code"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
  * ^definition = """The \"body\" of the report is organized as a tree of up to two levels of sections: top level sections represent laboratory specialties. A top level section SHALL contain either one text block carrying all the text results produced for this specialty along with Laboratory Data Entries or a set of Laboratory Report Item Sections. In the first case the specialty section happens to also be a leaf section. In the latter case, each (second level) leaf section contained in the (top level) specialty section represents a Report Item: i.e., a battery, a specimen study (especially in microbiology), or an individual test. In addition, any leaf section SHALL contain a Laboratory Data Entries containing the observations of that section in a machine-readable format."""

/*  IS THE SLICE NEEDED IN THIS CASE ?
// check with the XDlab structure */

/*
Variant 2: Text and Entry - With this option, the Laboratory Specialty Section text SHALL be present and not blank. This narrative block SHALL present to the human reader, all the observations produced for this Specialty, using the various structures available in the CDA Narrative Block schema (NarrativeBlock.xsd): tables, lists, paragraphs, hyperlinks, footnotes, references to attached or embedded multimedia objects. The narrative block is fully derived from the entry containing the machine-readable result data. Additionally, a single Laboratory Report Data Processing Entry SHALL be present with attribute typeCode=\"DRIV\". This entry contains the machine-readable result data from which the narrative block of this section is derived."""
*/


/* TO DO

How to manage the Payer data ? should it be a separate section ? sboud they be part of the diagnosticReport ?
How to manage the annotation section ? should it be a separate section ?

*/

// --------------------------------------
// Common rules for all the sections
// ---------------------------------

* section.title 1..
* section.code 1..
* section.code only CZ_CodeableConcept

// RH - this constraint to only Narrative is already in the base Composition resource
//* section.text only Narrative

// -------------------------------------
// Single section  0 .. 1
// -------------------------------------

* section contains lab-no-subsections ..* // check if ..1 or ..*
* section[lab-no-subsections]
  * ^short = "Variant 1: Laboratory Report section with text and entry"
  * ^definition = """Variant 1: With this option, the Section text SHALL be present and not blank. This narrative block SHALL present to the human reader, all the observations produced for this Specialty, using the various structures available for the FHIR  Narrative. The narrative block should be fully derived from the entry containing the machine-readable result data. Additionally, Laboratory Report Data Entries SHALL be present. This entry contains the machine-readable result data from which the narrative block of this section should be derived."""
  * code from CZ_LabStudyTypesVS (preferred)
  * text ^short = "Text summary of the section, for human interpretation."
  * entry only Reference (CZ_ObservationResultLaboratory)
  * entry 1..
  * section ..0

// -------------------------------------
// Structured sections  0 .. 1
// -------------------------------------
* section contains lab-subsections ..* // check if ..1 or ..*
* section[lab-subsections]
  * ^short = "Variant 2: EU Laboratory Report section with one to many subsections Laboratory Report Item"
  * ^definition = """Varient 2: With this option, this Laboratory Specialty Section SHALL contain NEITHER a top level text NOR entry elements. Each Report Item is contained in a corresponding Laboratory Report Item Section which contains the Lab Report Data Entry."""
  * code only CZ_CodeableConcept
  * code from CZ_LabStudyTypesVS (preferred)
  * text 0..0
  * entry 0..0
  * section 1..
    * code 1..
    * code only CZ_CodeableConcept
    * code from CZ_LabStudyTypesVS (preferred)
    * text ^short = "Text summary of the section, for human interpretation."
    * entry 1..
    * entry only Reference (CZ_ObservationResultLaboratory)
    * section 0..0

// -------------------------------------
// Annotation section  0 .. 1
// -------------------------------------

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