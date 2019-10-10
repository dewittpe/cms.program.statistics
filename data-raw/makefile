SOURCES = $(wildcard *.R)
TARGETS = $(addsuffix .Rout, $(basename $(SOURCES)))

all : $(TARGETS)

%.Rout : %.R
	R CMD BATCH --vanilla $<
