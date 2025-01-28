/*

Profile: CZ_LaboratoryReportComposition
Parent: Composition
Id: cz-laboratory-report-composition
Title: "Laboratory Report Composition (CZ)"
Description: "Czech profile for a composition - to be used when a laboratory report is sent as FHIR Document"
//* ^url = "https://ncez.mzcr.cz/standards/fhir/ig/lab/StructureDefinition/cz-laboratory-report-composition"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2022-08-28T16:06:00+01:00"
* ^publisher = "Národní centrum elektronického zdravotnictví"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://ncez.mczr.cz"
* ^jurisdiction = $iso3166#CZ
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = 1


//* text.status = #empty
* identifier 1.. MS
* status MS
* type MS
* subject 1.. MS
* subject only Reference(Resource or CZ_PatientCore)
* date MS
* author only Reference(Device or RelatedPerson or CZ_PractitionerCore or CZ_PractitionerRoleCore or CZ_PatientCore or CZ_OrganizationCore)
* author MS
* author ^short = "Who and/or what authored the Laboratory Report"
* author ^definition = "Identifies who is responsible for the information in the Laboratory Report, not necessarily who performed laboratory observations."
* attester 1..
* event ^short = "The laboratory service(s) being documented"
// add deatails avbout the service
* title MS
* title ^short = "Laboratory Report"
* title ^definition = "Official human-readable label for the composition.\r\n\r\nFor this document should be \"Laboratorní Nález\""

* relatesTo MS
* section 1..1 MS
* section.entry 1..1 MS
* section.entry only Reference(CZ_LaboratoryReport)


*/