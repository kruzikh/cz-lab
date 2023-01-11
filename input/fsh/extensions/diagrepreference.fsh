//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Extension: DiagnosticReportReference
Id:   composition-DiagnosticReportReference
Title:  "Document DiagnosticReport Reference"
Description: "This extension provides a reference to the DiagnosticReport instance that is associated with this document."
// publisher, contact, and other metadata here using caret (^) syntax (omitted)
* ^context[+].type = #element
* ^context[=].expression = "Composition"
* value[x] only Reference (DiagnosticReport)
