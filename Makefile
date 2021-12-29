# *** missing separator? - never forget that Make wants to see <tab>, not 4 spaces

in_venv=.venv/bin/activate

.PHONY: default
default: .venv
	. $(in_venv); sphinx-build -b html source docs


.PHONY: view
view:
	open http://localhost:8888/
	cd docs/; python -m SimpleHTTPServer 8888

.venv:
	python3 -m venv .venv
	. $(in_venv); pip3 install -r requirements.txt

clean:
	rm -Rf build/ .venv/