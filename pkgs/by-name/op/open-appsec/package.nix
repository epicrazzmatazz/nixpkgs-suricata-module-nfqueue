{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  boost,
  openssl,
  pcre2,
  libxml2,
  gtest,
  curl,
  redis,
  hiredis,
  dotnetPackages,
  yq,
}:
stdenv.mkDerivation rec {
  pname = "open-appsec";
  version = "1.1.34";
  src = fetchFromGitHub {
    owner = "openappsec";
    repo = "openappsec";
    rev = version;
    hash = "sha256-2MGGqrIaTn/hRyeaxdmPEx/UubOu/z3HC9MM8ozI76o=";
  };
  nativeBuildInputs = [
    cmake
    pkg-config
    boost
    openssl
    pcre2
    libxml2
    gtest
    curl
    redis
    hiredis
    dotnetPackages.MaxMindDb
    yq
  ];
  cmakeFlags = [ "-DCMAKE_POLICY_VERSION_MINIMUM=3.5" ];
  buildFlags = [ "-j1" ];
}
