CABAL    = cabal

all: sandbox install_sandbox configure build

test: sandbox install_sandbox configure_test build run_test

stylish:
	find -type d \( -path ./dist -o -path ./.cabal-sandbox \) -prune -o -name "*.hs" -print | xargs -n1 -P2 stylish-haskell --inplace

lint:
	hlint ./src ./lib ./test --report

doc:
	$(CABAL) haddock

clean: clean_sandbox clean_dist

configure:
	$(CABAL) configure

configure_test:
	$(CABAL) configure --enable-test

build:
	$(CABAL) build

run_test:
	$(CABAL) test

clean_sandbox:
	rm -rf .cabal-sandbox cabal.sandbox.config

clean_dist:
	rm -rf dist

sandbox: cabal.sandbox.config | .cabal-sandbox

cabal.sandbox.config: | .cabal-sandbox

.cabal-sandbox:
	$(CABAL) sandbox init

install_sandbox:
	$(CABAL) install --only-dependencies
