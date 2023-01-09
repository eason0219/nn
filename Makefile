LDFLAGS = -pthread -lpthread
CFLAGS = -g -Wall -Werror
backprop: backprop.o layer.o neuron.o
	$(CC) $(LDFLAGS) -o backprop build/main.o build/layer.o build/neuron.o -lm -o bin/backdrop

backprop.o: src/main.c
	$(CC) $(CFLAGS) -c src/main.c -o build/backdrop.o

layer.o: src/layer.c
	$(CC) $(CFLAGS) -c src/layer.c -o build/layer.o

neuron.o: src/neuron.c
	$(CC) $(CFLAGS) -c src/neuron.c -o build/neuron.o
	
run:
	./bin/backprop

# remove object files and executable when user executes "make clean"
clean:
	rm *.o backprop
