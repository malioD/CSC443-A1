#Makefile

CC = g++
LISA = csv2colstore select2 select3 write_fixed_len_page read_fixed_len_page
SAMMY = csv2heapfile scan insert select update delete
ALL = $(LISA) $(SAMMY) 

all: library.o $(LISA) $(SAMMY)

sammy: library.o $(SAMMY)

library.o: library.cc library.h
	$(CC) -o $@ -c $<

csv2heapfile: csv2heapfile.cc library.o
	$(CC) -o $@ $< library.o

scan: scan.cc library.o
	$(CC) -o $@ $< library.o

insert: insert.cc library.o
	$(CC) -o $@ $< library.o

update: update.cc library.o
	$(CC) -o $@ $< library.o

delete: delete.cc library.o
	$(CC) -o $@ $< library.o

select: select.cc library.o
	$(CC) -o $@ $< library.o

csv2colstore: csv2colstore.cc library.o
	$(CC) -o $@ $< library.o

select2: select2.cc library.o
	$(CC) -o $@ $< library.o

select3: select3.cc library.o
	$(CC) -o $@ $< library.o

write_fixed_len_page: write_fixed_len_page.cc library.o
	$(CC) -o $@ $< library.o

read_fixed_len_page: read_fixed_len_page.cc library.o
	$(CC) -o $@ $< library.o

clean:
	rm -f $(ALL) *.o
