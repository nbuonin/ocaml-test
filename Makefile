PROJECT ?= ocaml-test
PROJECT_TOP ?= hello_world
OCAML_SENTINAL ?= .ocaml-sentinal
OPAM_FILE ?= opam

$(OCAML_SENTINAL): $(OPAM_FILE)
	rm -rf _opam
	opam switch create ./ -y
	touch $@

$(PROJECT_TOP).native: clean $(PROJECT_TOP).ml 
	ocamlbuild $@

test: $(OCAML_SENTINAL)
	echo "This is a test that will pass"

clean: 
	ocamlbuild -clean

.PHONY: test clean
