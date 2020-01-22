TARGET     =  2048
PREFIX    :=  /usr
BINDIR     =  $(PREFIX)/games
OBJS      :=  $(patsubst %.cpp,%.o,$(wildcard *.c))
CXX       :=  gcc
LDLIBS    +=  

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ -o $@ $(LDLIBS)

install: $(TARGET)
	install -d $(DESTDIR)$(BINDIR)
	install -Dm755 $(TARGET) $(DESTDIR)$(BINDIR)/$(TARGET)

remove: uninstall

uninstall:
	$(RM) $(DESTDIR)$(BINDIR)/$(TARGET)

clean:
	$(RM) $(wildcard ./*.o) $(TARGET)

.PHONY: install remove uninstall clean
