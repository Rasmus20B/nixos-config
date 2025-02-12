
{ pkgs, ... }:

let 
  mappings = import ./mappings.nix; 
  plugins = import ./plugins.nix { inherit pkgs; };
  debugging = import ./debugging.nix;
  options = import ./options.nix;
in {
  imports = [ mappings options plugins debugging ];
}


