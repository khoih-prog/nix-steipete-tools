{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "goplaces";
  version = "0.2.2-dev";

  src = fetchFromGitHub {
    owner = "joshp123";
    repo = "goplaces";
    rev = "c7be7782989c4f2d24aba8c1122d0b6207247d31";
    hash = "sha256-noyIyj7dtVscUUSUlcUhKt45QUH/bZL/fINwqR6fZS0=";
  };

  subPackages = [ "cmd/goplaces" ];

  ldflags = [
    "-s"
    "-w"
    "-X github.com/steipete/goplaces/internal/cli.Version=${version}"
  ];

  vendorHash = "sha256-OFTjLtKwYSy4tM+D12mqI28M73YJdG4DyqPkXS7ZKUg=";

  meta = with lib; {
    description = "Modern Go client + CLI for the Google Places API";
    homepage = "https://github.com/joshp123/goplaces";
    license = licenses.mit;
    platforms = platforms.darwin ++ platforms.linux;
    mainProgram = "goplaces";
  };
}
