function nhp
	mkdir -p ./$argv
	cd ./$argv
	wget http://www.stackage.org/lts/cabal.config
	cabal update
	cabal init -n --is-executable --license=MIT
	cabal sandbox init
end
