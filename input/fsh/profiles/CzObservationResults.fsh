Profile: CZ_ObservationResult
Parent: Observation
Id: cz-observation-result
Title: "Observation Result (CZ)"
Description: "This profile constrains the Observation resource to represent various types of results and associated observations. This is the base profile from which the other results profiles are derived."

* ^experimental = false
* ^publisher = "NCEZ"
* ^purpose = "This profile constrains the Observation resource to represent various types of results and associated observations."

* status = #final (exactly)
* status ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-display-hint"
* status ^extension.valueString = "default: final"

* category only CZ_CodeableConcept

* code only CZ_CodeableConcept
* code MS

* subject 1.. MS
* subject only Reference(CZ_PatientLab or Group or CZ_MedicalDevice or Device or Location)
* subject.reference 1.. MS

* effective[x] 1.. MS
* effective[x] only dateTime or Period
* effective[x].extension contains $data-absent-reason named data-absent-reason 0..1 MS
* effective[x].extension[data-absent-reason] ^short = "effective[x] absence reason"
* effective[x].extension[data-absent-reason] ^definition = "Provides a reason why the effectiveTime is missing."

* performer only Reference(CZ_Practitioner or CZ_PractitionerRoleLab or CZ_Organization or CareTeam or CZ_PatientLab or RelatedPerson)
* value[x] MS
* hasMember only Reference(CZ_ObservationResult or QuestionnaireResponse or MolecularSequence)
* component MS