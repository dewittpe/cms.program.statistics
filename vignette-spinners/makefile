SOURCES = $(wildcard *.R)
TARGETS = $(addsuffix .Rmd, $(basename $(SOURCES)))

all : $(TARGETS)

%.Rmd : %.R
	Rscript --vanilla -e "knitr::spin(hair = '$<', knit = FALSE)"
	if [ ! -f ../vignettes/$@ ]; then ln -s ../vignette-spinners/$@ ../vignettes/$@; fi

clean :
	$(RM) -f $(TARGETS)

