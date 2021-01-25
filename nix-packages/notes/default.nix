{ pkgs ? import <nixpkgs> {}}:
let f = { stdenv, lib, buildGoModule, fetchFromGitHub }:
buildGoModule rec {
  pname = "notes";
  version = "0.7.2";

  src = fetchFromGitHub {
    owner = "bittersweet";
    repo = "notes";
    rev = "v${version}";

    sha256 = "0lqqzwdrfp0nbbgvgpga9p5i2vh96fw8piipga7gd7bg0q9fqv53";
  };

  vendorSha256 = "0gmjn43pyfkmy4cj5w3jlsq3a37wfdaczx49hbka15f95km6z1d6";

  doCheck = false;

  meta = with lib; {
    description = "Notes";
    homepage = "https://github.com/bittersweet/notes";
    maintainers = [ "markmulder@gmail.com" ];
  };
};
in pkgs.callPackage f {}
