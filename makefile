PRJ=N-MAX
REV=V1
NEWPRJ=TEST_PROJECT
DVCS=HG

GER1 :=.\gerber\$(PRJ).EXTREP
GER_FILES =$(GER1) .\gerber\all_layers.pdf

REVIEW_FILES =\
.\gerber\all_layers.pdf \
log.txt \
3D.pdf \
sch.pdf \
cam.pdf

ASM_FILES =\
.\asm\placeplan_mech15_smartpdf.PDF \
.\asm\Pick_Place.csv \
.\asm\Pick_Place.txt \
.\gerber\all_layers.pdf \
.\3D.pdf \
.\bom\PartsList.xlsx

FLEX_FILES =\
.\deliverables\ODB.zip \
.\bom\PurchaseList.xlsx \
.\deliverables\review.zip \
.\deliverables\asm.zip \
.\gerber\gerberFiles.zip


SCH := $(wildcard *.PcbDoc)
PCB := $(wildcard *.PcbDoc)
ORD := $(wildcard .\ord\*)

DELIVERABLES_FILES = $(GERBER_FILES) $(REVIEW_FILES) $(ASM_FILES) $(PURCHASE_FILES) $(SCH) $(PCB) \
$(REQUIREMENTS_FILES) review.txt gerber.txt requirements.txt

PURCHASE_FILES =.\bom\PurchaseList.xlsx

REQUIREMENTS_FILES = .\requirements\requirements_text.txt


all:  gerber.txt asm.txt purchase.txt  requirements.txt review.txt deliverables.txt integrity flex.txt

review.txt: $(REVIEW_FILES)
	review.cmd

gerber.txt: $(GER_FILES)
	gerber.cmd $(PRJ) $(REV)

asm.txt: $(ASM_FILES)
	asm.cmd 

purchase.txt: $(PURCHASE_FILES)
	purchase.cmd 	

deliverables.txt: $(DELIVERABLES_FILES)
	deliverables.cmd $(PRJ) $(REV)

requirements.txt: $(REQUIREMENTS_FILES)
	requirements.cmd 

clean:
	clean.cmd

project:
	project.cmd $(NEWPRJ) $(DVCS) 

integrity:
	integrity.cmd

cleanDeep:
	cleanDeep.cmd

flex.txt: $(FLEX_FILES)
	flex.cmd $(PRJ) $(REV)	



