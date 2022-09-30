/* Extension: CZ_ReferenceRangeComment
Id: cz-ext-referencerange-comment
Title: "Comment extension for ReferenceRange"
Description: "Extension that adds a comment to Observation.ReferenceRange"
* ^context[+].type = #element
* ^context[=].expression = "Observation.referenceRange"
* value[x] only CZ_CodedAnnotation
 */
Profile: CZ_ObservationLaboratory
Parent: Observation
Id: cz-observation-laboratory
Title: "Observation Laboratory (CZ)"
Description: "Czech profile for an observation in a laboratory report"
* ^url = "https://www.ncez.mzcr.cz/standards/fhir/lab/StructureDefinition/cz-observation-laboratory"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2021-11-08T16:57:45+01:00"
* ^publisher = "Národní centrum elektronického zdravotnictví"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://ncez.mzcr.cz"
* ^jurisdiction = $iso3166#CZ
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = 1


//* text.status = #empty
* language MS
* identifier MS
//* basedOn ^mustSupport = false
* partOf ^mustSupport = false
* status MS
* category MS
// from DE
* category 1.. MS
* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains
//    loinc-observation 1..1 MS and
    observation-category 1..1 MS
//* category.coding[loinc-observation] = $loinc#26436-6
* category.coding[observation-category] = $observation-category#laboratory
// --------------
//stuff from BeObservation
//* code only BeObservationCodeableConcept
* code MS
* code ^definition = "Describes what was observed. Sometimes this is called the observation \"name\".\r\n\r\nThe implementer SHALL adhere to the preferred codes to use.\r\nThe recommended codification used is NCLP. It is allowed to use multiple codes within the FHIR CodeableConcept datatype. But the first code given must follow the following rules.(Other codes given will be for information purposes.)\r\n\r\nThe actual observation is preferably coded in NCLP \r\n\r\nIf that is not possible, laboratory may send its own local code plus obligatory a text element to further explain. \r\n\r\nIf that is not possible the kind of observation is expressed only in text (allowed but NOT RECOMMENDED)"
* code from $nclp
//* code.coding ^slicing.discriminator.type = #value
//* code.coding ^slicing.discriminator.path = "system"
//* code.coding ^slicing.rules = #open
// DE
//* code MS
//* code from $results-laboratory-observations-uv-ips (preferred)
//* code ^binding.description = "Intensional Value Set Definition: LOINC {  {    STATUS in {ACTIVE}    CLASSTYPE in {1}    CLASS exclude {CHALSKIN, H&P.HX.LAB, H&P.HX, NR STATS, PATH.PROTOCOLS.*}  } }"
//----------
* subject only Reference(Group or Device or Location or CZ_Patient)
* subject MS
* subject ^short = "In the initial iteration of the Czech interoperability project: this is Patient (CZ)."
* effective[x] MS
// DE
* effective[x] 1.. MS
* effective[x] only dateTime or Period
* effective[x] obeys mii-lab-1
* effective[x].extension ^slicing.discriminator.type = #value
* effective[x].extension ^slicing.discriminator.path = "url"
* effective[x].extension ^slicing.rules = #open
* effective[x].extension contains CZ_LabClinicallyRelevantTime named ClinicallyRelevantTime 0..1 MS
//----------


* issued MS
* performer only Reference(CareTeam or RelatedPerson or CZ_Patient or CZ_Organization or CZ_PractitionerRole or CZ_Practitioner)
* performer MS
* performer ^short = "In the initial iteration of the Czech interoperability project: this is Organization (CZ) or Practitioner (CZ)"
* value[x] MS
* dataAbsentReason MS
* interpretation MS
//* interpretation from be-vs-observation-interpretation
* note MS
//* note only CZ_CodedAnnotation
* bodySite MS
* method MS
* specimen only Reference(CZ_SpecimenLaboratory)
* specimen MS
//* device ^mustSupport = false
* referenceRange MS
//* referenceRange.extension contains CZ_ReferenceRangeComment named Comment 0..*
* hasMember only Reference(QuestionnaireResponse or MolecularSequence or CZ_ObservationLaboratory)
* hasMember MS
* hasMember ^short = "In the initial iteration of the Czech interoperability project: this is ObservationLaboratory (CZ)"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or MolecularSequence or CZ_ObservationLaboratory)
* derivedFrom MS
* derivedFrom ^short = "In the initial iteration of the Czech interoperability project: this can be ObservationLaboratory (CZ) or Media"
* component MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code.coding.code"
* component ^slicing.rules = #open
* component contains
    relativeTimeQualifier 0..1 and
    substanceAmountQualifier 0..1 and
    productNameQualifier 0..1
* component[relativeTimeQualifier] ^short = "If a testing code does not include a time interval but needs one to qualify the code."
* component[relativeTimeQualifier].code.coding.system 1..
* component[relativeTimeQualifier].code.coding.system = "http://snomed.info/sct" (exactly)
* component[relativeTimeQualifier].code.coding.code 1..
* component[relativeTimeQualifier].code.coding.code = #118578006 (exactly)
* component[relativeTimeQualifier].code.coding.display 1..
* component[relativeTimeQualifier].code.coding.display = "Relative time" (exactly)
* component[relativeTimeQualifier].value[x] 1..
* component[relativeTimeQualifier].value[x] only Quantity
* component[relativeTimeQualifier].value[x] ^short = "UCUM"
* component[substanceAmountQualifier] ^short = "If a testing code does not include a substance amount but needs one to qualify the code"
* component[substanceAmountQualifier].code.coding.system 1..
* component[substanceAmountQualifier].code.coding.system = "http://snomed.info/sct" (exactly)
* component[substanceAmountQualifier].code.coding.code 1..
* component[substanceAmountQualifier].code.coding.code = #118555000 (exactly)
* component[substanceAmountQualifier].code.coding.display 1..
* component[substanceAmountQualifier].code.coding.display = "Substance amount" (exactly)
* component[substanceAmountQualifier].value[x] 1..
* component[substanceAmountQualifier].value[x] only Quantity
* component[substanceAmountQualifier].value[x] ^short = "UCUM"
* component[productNameQualifier] ^short = "If a testing code does not include a product name but needs one to qualify the code"
* component[productNameQualifier].code.coding.system 1..
* component[productNameQualifier].code.coding.system = "http://snomed.info/sct" (exactly)
* component[productNameQualifier].code.coding.code 1..
* component[productNameQualifier].code.coding.code = #774167006 (exactly)
* component[productNameQualifier].code.coding.display 1..
* component[productNameQualifier].code.coding.display = "Product name" (exactly)
* component[productNameQualifier].value[x] 1..
* component[productNameQualifier].value[x] only CodeableConcept or string
//* subject only Reference(Patient or Group or Device or Location or BePatient)
//* performer 1..
//* performer only Reference(Practitioner or PractitionerRole or Organization or CareTeam or Patient or RelatedPerson or BePatient or BeOrganization or BePractitionerRole or BePractitioner)
//* performer ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\nSpecial remarks for KMEHR users:\r\nIn a KMEHR context, this would be 'author'."

// DE
// * value[x] only Quantity or CodeableConcept or Range or Ratio
// * value[x] MS
// * valueQuantity only Quantity
// * valueQuantity MS
// * valueQuantity ^sliceName = "valueQuantity"
// * valueQuantity.value 1.. MS
// * valueQuantity.unit 1.. MS
// * valueQuantity.system 1.. MS
// * valueQuantity.system = "http://unitsofmeasure.org" (exactly)
// * valueQuantity.code 1.. MS
// * valueQuantity.code ^comment = "The mandatory system is UCUM."
// * valueCodeableConcept only CodeableConcept
// * valueCodeableConcept MS
// * valueCodeableConcept ^sliceName = "valueCodeableConcept"
// * valueCodeableConcept.coding 1.. MS
// * valueCodeableConcept.coding.system 1.. MS
// * valueCodeableConcept.coding.code 1.. MS
// * dataAbsentReason MS
// * interpretation MS
// * note MS
// * bodySite ..0
// * method MS
// * specimen MS
// * specimen.reference MS
// * specimen.identifier MS
// * device MS
// * referenceRange MS
// ----------------