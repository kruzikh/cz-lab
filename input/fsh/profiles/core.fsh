// Toto je pouze testovací soubor, budou nahrazen reálným obsahem pro laboratorní IG

//============== ALIAS ===============
//Alias: ips_DiagnosticReport = http://hl7.org/fhir/uv/ips/StructureDefinition/DiagnosticReport-uv-ips
//Alias: ips_Patient = http://hl7.org/fhir/uv/ips/StructureDefinition/Patient-uv-ips
//Alias: $Condition-uv-ips = http://hl7.org/fhir/uv/ips/StructureDefinition/Condition-uv-ips
//Alias: $bodySite = http://hl7.org/fhir/StructureDefinition/bodySite
//Alias: $flag-detail = http://hl7.org/fhir/StructureDefinition/flag-detail
//Alias: $flag-priority = http://hl7.org/fhir/StructureDefinition/flag-priority
//Alias: $MedicationStatement-uv-ips = http://hl7.org/fhir/uv/ips/StructureDefinition/MedicationStatement-uv-ips
//Alias: $Organization-uv-ips = http://hl7.org/fhir/uv/ips/StructureDefinition/Organization-uv-ips
//=========================


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CZ_LabPatient
Parent:   CZ_Patient
Id:       cz-labpatient
Title:    "Patient (CZ)"
Description: "This profile defines how to represent Patient in FHIR for the purpose of the exchange of laboratory result reports."

//-------------------------------------------------------------------------------------------
* ^description = "Information about an individual receiving health care services"

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CZ_LabAddress
Parent:   CZ_Address
Id:       cz-labaddress
Title:    "Address (CZ)"
Description: "This profile specifies national standard for expression of address information."
