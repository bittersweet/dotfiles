{ pkgs ? import <nixpkgs> {}}:
let f = { stdenv, lib, buildGoModule, fetchFromGitHub }:
buildGoModule rec {
  pname = "ghopen";
  version = "6839c87a4051bb7eca4b85d26892d1e488c20266";

  src = fetchFromGitHub {
    owner = "bittersweet";
    repo = "ghopen";
    rev = version;

    sha256 = "1y0zyhyf6xiin76r8hryhs85xlmdvg4q7rs63di4rc2l80p7h7l0";
  };

  vendorSha256 = "0sjjj9z1dhilhpc8pq4154czrb79z9cm044jvn75kxcjv6v5l2m5";

  doCheck = false;

  meta = with lib; {
    description = "Open github links";
    homepage = "https://github.com/bittersweet/ghopen";
    maintainers = [ "markmulder@gmail.com" ];
  };
};
in pkgs.callPackage f {}
