ESTADOS = $(shell cut -d ';' -f 1 map.csv)
ARQUIVOS = $(foreach estado,$(ESTADOS),$(estado).js)
ANO = 2009

all: $(ARQUIVOS)

%.js: municipios.csv
	./list $$(echo $@ | cut -d . -f 1) $< > $@

municipios.csv: $(ANO).csv
	cut -d ';' -f 2,8 $< | sort | uniq > $@

clean:
	$(RM) municipios.csv $(ARQUIVOS)
