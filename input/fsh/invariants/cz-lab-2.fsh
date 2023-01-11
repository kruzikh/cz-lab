Invariant: cz-lab-2
Description: "pokud není uveden element \"hasMember\" pak Observation element \"value\" musí býát uveden"
Severity: #error
Expression: "value.exists() or hasMember.exists()"