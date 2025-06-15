NBCONVERT := jupyter nbconvert --template my-reveal --to slides --stdout

all: Parallel_Distributed.html Parallel_Threaded.html

%.html: %.ipynb
	$(NBCONVERT) $^ > $@

clean:
	rm *.html
