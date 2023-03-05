# Laboratorní nález

### Informace o projektu
Tato implementační specifikace byla vypracována v rámci národního projektu interoperability MZČR.

### Účel dokumentu
Tato implementační specifikace určuje způsob reprezentace laboratorní výsledkové zprávy (laboratorního nálezu) pomocí standardu HL7 FHIR.

Alternativní reprezentací laboratorního nálezu je standard [DASTA](https://www.dastacr.cz/dasta/start.htm).

>⚠️ **Upozornění:** Vzhledem k rozhodnutí ukončit do roku 2027 další rozvoj a podporu standardu DASTA, doporučujeme všem implementátorům přechod k mezinárodnímu standardu HL7 FHIR.

### Rozsah specifikace
Tato implementační specifikace vychází z dokumentu **Funkční specifikace laboratorního nálezu**, který stanovuje základní požadavky, obsah a strukturu laboratorního nálezu.

**ZAHRNUTÉ OBLASTI:**
Laboratorní výsledky v rámci stěžejních oborů in vitro diagnostiky jako jsou klinická biochemie, hematologie, transfuzní lékařství, mikrobiologie a imunologie.

**NEZAHRNUTÉ OBLASTI:**
Specializované laboratorní oblasti vyžadující specifickou strukturu výsledkových zpráv jako jsou histopatologie nebo lékařská genetika.

Následující obrázek vyjadřuje základní informační bloky laboratorního nálezu.

{% include img.html img="Lab-composition.png" caption="Obrázek 1: Obsah laboratorního nálezu" width="70%" %}

### Souvislosti s dalšími specifikacemi

Laboratorní nález obsahuje řadu obecných datových bloků, které jsou využitelné také v dalších typech zdravotnické dokumentace jako je pacientský souhrn, propouštěcí zpráva, ambulantní zpráva apod.

{% include dependency-table.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}
