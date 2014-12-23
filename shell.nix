{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.haskellPackages_ghc783
}:

haskellPackages.cabal.mkDerivation (self: {
  pname = "Rotunda";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = false;
  buildDepends = with haskellPackages; [ ];
  buildTools = with haskellPackages; [ cabalInstall ];
  meta = {
    homepage = "https://github.com/Chobbes/Rotunda";
    description = "Task schedular.";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
