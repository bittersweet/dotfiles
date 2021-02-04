{ pkgs ? import <nixpkgs> {}}:
let f = { lib, rustPlatform }:
rustPlatform.buildRustPackage rec {
  pname = "snippets";
  version = "1.0.0";

  src = pkgs.fetchgit {
    url = "git+ssh://git@github.com/bittersweet/snippets.git";
    rev = "4073d635bfe215a6cafbe3b36efe2056d9ca8076";
    sha256 = lib.fakeSha256;
  };

  cargoHash = lib.fakeHash;

  meta = with lib; {
    description = "Snippets";
    homepage = "https://github.com/bittersweet/snippets";
    maintainers = [ "markmulder@gmail.com" ];
  };
};
in pkgs.callPackage f {}
