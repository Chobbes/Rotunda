{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.haskellPackages
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "Rotunda";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = false;
  buildDepends = with haskellPackages; [ pandoc ];
  buildTools = with haskellPackages; [ cabalInstall ];
  meta = {
    homepage = "https://github.com/Chobbes/Rotunda";
    description = "Task schedular.";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
